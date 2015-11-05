# class Contact
 
# 	attr_accessor :first_name, :last_name, :email, :notes, :id

# 	@@contacts = []
# 	@@id = 1


# 	def initialize(first_name, last_name, email, notes)
# 		@id = @@id
# 		@first_name = first_name
# 		@last_name = last_name
# 		@email = email
# 		@notes = notes
# 		@@id +=1 
# 	end

# 	def self.create(first_name, last_name, email, notes)
# 		new_contact = Contact.new(first_name, last_name, email, notes)
# 		@@contacts << new_contact
# 	end

# 	def self.all
# 		@@contacts
# 	end

# end

class Contact
 
	attr_accessor :first_name, :last_name, :email, :notes, :id

	@@contacts = []
	@@id = 1


	def initialize(first_name, last_name, email, notes)
		@id = @@id
		@first_name = first_name
		@last_name = last_name
		@email = email
		@notes = notes
		@@id +=1 
	end

	def self.create(first_name, last_name, email, notes)
		new_contact = Contact.new(first_name, last_name, email, notes)
		@@contacts << new_contact
		new_contact
	end

	def self.all
		@@contacts
	end

	def self.delete_all
		@@contacts = [] 
	end

	def self.find(id_number)
		@@contacts.find do |x|
			if id_number = x.id
				return x
			end
		end
	end

	def full_name
		return "#{first_name} #{last_name}"
	end

	def update(attribute, newvalue)
		@newvalue = newvalue
		if attribute == "note"
			change_note
		elsif attribute == "first_name"
			change_first_name
		elsif attribute == "last_name"
			change_last_name
		elsif attribute == "email"
			change_email
		end
	end

	def change_note
		notes = @newvalue
		return notes
	end

	def change_first_name
		first_name = @newvalue
		return first_name
	end

	def change_last_name
		last_name = @newvalue
		return last_name
	end

	def change_email
		email = @newvalue
		return email
	end

	def self.search_by_attribute(attribute, value)
		if attribute == "first_name"
			@@contacts.each do |x|
				if x.first_name == value
					x
				end
			end
		elsif attribute == "last_name"
			@@contacts.each do |x|
				if x.last_name == value
					x
				end
			end
		elsif attribute == "email"
			@@contacts.each do |x|
				if x.email == value
					x
				end
			end
		elsif attribute == "notes"
			@@contacts.each do |x|
				if x.notes == value
					x
				end
			end
		end
	end
	
	def delete
		@@contact = []
	end

end
