module PopulateHelper
  def solve_problems(attend, problems)
    pcount = (1..problems.count).to_a.sample
    problems.shuffle!
    # Submit some wrong answers
    problems.take(pcount).each do |p|
      Problem::TYPES.each do |type|
        (0..5).to_a.sample.times do 
          attend.submit(p, 'dummy', type)
        end
      end
    end
    # Submit some correct answers
    problems.take(pcount).each do |p|
      tcount = (1..Problem.types.count).to_a.sample
      Problem::TYPES.take(tcount).each do |type|
        ans = p.output(type)
        attend.submit(p, ans, type)
      end
    end
  end
end
