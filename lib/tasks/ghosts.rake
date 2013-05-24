desc "Fill database with ghost users"
task :ghosts, [:n_groups, :n_users] => :environment do |t, args|
  if args[:n_groups].nil? or args[:n_users].nil?
    puts "Usage: rake ghost[num_groups,num_users(per group)]"
    exit
  end
  csv = File.new("ghosts.csv", "w")
  csv.write("GroupName,UserID,UserPassword\n")
  (1..args[:n_groups].to_i).each do |gi|
    group = Group.create(name: "Group#{gi}")
    (1..args[:n_users].to_i).each do |ui|
      pass = (1..8).map{ ('a'..'z').to_a[rand(26)] }.join
      user = User.new_with_password({uid: "user_#{gi}_#{ui}"}, pass)
      user.save
      group.users.push(user)
      csv.write("#{group.name},#{user.uid},#{pass}\n")
    end
  end
  csv.close
end
