require "open-uri"
require "nokogiri"
require "date"


class MatchesController < ApplicationController
  def index
    @team = Team.where(tournament: params[:tournament_id], user: current_user).first
    @matches = @team.matches
  end

  def new
    @match = Match.new,
    @teams = Team.all
  end

  def create
    @match = Match.new(match_params)
    @match = Team.find(params[:team_id])
    if @match.save
      redirect_to match_path(@match)
    else
      render :new
    end
  end

  def show
    @match = Match.find(params[:id])
    @tournament = @match.tournament
    @line_up = @match.line_ups
    # update_results
  end

  def update_results
    @line_up.each do |line_up|
      result = 0
      (1..10).each do |i|
        fetch_data(line_up.politic.last_name, i)
        result += @score
      end
      line_up.result = result
    end
  end

  private

  MONTHS_ABBR_TO_NUM = {
    'janv.' => 1,
    'févr.' => 2,
    'mars' => 3,
    'avr.' => 4,
    'mai' => 5,
    'juin' => 6,
    'juil.' => 7,
    'août' => 8,
    'sept.' => 9,
    'oct.' => 10,
    'nov.' => 11,
    'déc.' => 12
  }

  def match_params
    params.require(:match).permit(:team_id)
  end

  def fetch_data(politic, i)
    @score = 0
    @dates = []
    politic = CGI.escape(politic)
    @url = "https://www.dna.fr/recherche?q=#{politic}&x=1&y=5&x=1&y=1&page=#{i}"
    html_file = URI.open(@url).read
    @html_doc = Nokogiri::HTML.parse(html_file)
    @html_doc.search(".publish").each do |date_string|
      date_string_with_num_month = date_string.text.strip.gsub(/#{MONTHS_ABBR_TO_NUM.keys.join('|')}/, MONTHS_ABBR_TO_NUM)
      one_week_ago = Date.today - 7
      today = Date.today
      date_components = date_string_with_num_month.split(' ')
      day = date_components[0].to_i
      month = date_components[1].to_i
      year = date_components[2].to_i
      @dates << day
      @dates << month
      @dates << year
      @dates << date_string_with_num_month
      if Date.valid_date?(year, month, day)
        date = Date.parse(date_string_with_num_month)
        @score += 1 if date.between?(one_week_ago, today)
      else
        @score += 1
      end
    end
  end
end
