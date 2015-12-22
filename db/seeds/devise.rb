if (User.all.size==0) then
	u=User.create(id: 1, email:'user@test.test', name: "user", password:'000000', password_confirmation:'000000',confirmed_at: Time.now)
	u=User.create(id: 2, email:'admin@test.test', name: "admin", password:'000000', password_confirmation:'000000',confirmed_at: Time.now)
	u.admin=true
	u.save
	u=User.create(id: 3, email:'test@test.test', name: "test",password:'000000', password_confirmation:'000000',confirmed_at: Time.now)
	u.admin=true
	u.save
	p "User seeded"
end