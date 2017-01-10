class CandidatesController < ApplicationController
  def new
    @candidate = Candidate.new
  end
end
