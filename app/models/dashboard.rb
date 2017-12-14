class Dashboard
  def job_count_by_level_of_interest
    Job.
      group(:level_of_interest).
      count.
      sort_by { |level_of_interest, count| level_of_interest }.
      map { |current| { level_of_interest: current[0], count: current[1] } }
  end

  def top_companies
    Job.
      group(:company).
      average(:level_of_interest).
      sort_by { |company, level_of_interest| level_of_interest }.
      map { |current| { company: current[0], level_of_interest: current[1].to_i } }.
      reverse.
      first(3)
  end

  def job_count_by_location 
    Job.
      group(:city).
      count.
      sort_by{|city, count| city}.
      map {|current| { city: current[0], count: current[1] }}
  end 
end