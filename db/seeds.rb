u = User.create({name: "test", email: "test@tester.com", password: "test"});

g = Grid.new({user_id: u.id});
g.save;