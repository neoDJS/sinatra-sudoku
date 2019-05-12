u = User.new({name: "test", email: "test@tester.com", password: "test"});
u.save;

g = Grid.new({user_id: u.id});
g.save;