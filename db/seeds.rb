# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Cat.create(name: "Fido", color: "black", sex: "M", birth_date: '01/01/2013', age: 0)

Cat.create(name: "Fluffy", color: "white", sex: "F", birth_date: '01/01/2012', age: 1)
Cat.create(name: "Bill", color: "other", sex: "M", birth_date: '30/01/2013', age: 0)

CatRentalRequest.create(cat_id: 1, start_date: "01/01/2013",
  end_date: "01/05/2013", status: "PENDING")

CatRentalRequest.create(cat_id: 1, start_date: "02/01/2013",
  end_date: "01/05/2013", status: "PENDING")

CatRentalRequest.create(cat_id: 1, start_date: "03/01/2013",
  end_date: "01/05/2013", status: "PENDING")

CatRentalRequest.create(cat_id: 1, start_date: "01/06/2013",
  end_date: "01/07/2013", status: "PENDING")

CatRentalRequest.create(cat_id: 1, start_date: "01/06/2013",
  end_date: "01/07/2013", status: "DENIED")

CatRentalRequest.create(cat_id: 2, start_date: "01/06/2013",
  end_date: "01/07/2013", status: "APPROVED")
