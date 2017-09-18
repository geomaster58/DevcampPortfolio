User.create!(
  email: "test@test.com",
  password: "123456",
  password_confirmation: "123456",
  name: "Admin User",
  roles: "site_admin"
  )
puts "1 admin created"

User.create!(
  email: "test1@test.com",
  password: "123456",
  password_confirmation: "123456",
  name: "Reg User",
  roles: "user"
  )
puts "1 user created"

3.times do |x|
  Topic.create!(
  title: "Topic #{x}"
  )

 end 
puts "3 topics created"

10.times do |blog|

Blog.create!(

  title: "My blog post #{blog}", 
  body: "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.",
 
    topic_id: Topic.last.id

  )


end
puts "10 blog posts created"

5.times do |skill|
  Skill.create!(
    title: "Rails #{skill}",
    percent_utilized: 34
    )


  end
  puts "5 skills created"


8.times do |port|
  Portfolio.create!(

    title: "Portfolio title: #{port + 1}"  ,
    subtitle: "Ruby on Rails" ,
    body: "res et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum ",
    main_image:"http://via.placeholder.com/600x400" ,
    thumb_image:"http://via.placeholder.com/350x200" ,
    


    )
end
puts "8 portfolios created"



3.times do |technology|
Portfolio.last.technologies.create!(
  name: "Technology #{technology}"
  )

end
 puts "3 techs created"



