# Solution to Tech Test - Ruby CSV Contact List Processor

See the description of the tech test in the [readme](/README.md).

## Setup of project

The contact list processor project uses the following Ruby libraries:

- `csv` for processing files in CSV format
- `rspec` for testing the contact list processor classes and methods

Before starting work on the code the project was set up with the following:

- `.ruby-version` file to specify the version of Ruby used
- `Gemfile` with the `csv` and `rspec` libraries included in it
- `app` folder for the contact list processor's application files
- `spec` folder for the automated tests
- `spec/fixtures` for files to test the input CSV data and expected output CSV data

## Code design

The contact list processor was be designed using classes to encapsulate separate purposes of the contact list and the contacts it processes.

### `ContactList` class

The contact list class includes:

- the reading of the contacts data from a CSV file
- storing the list of contacts
- outputting the cleaned contacts data to a CSV file

It meets the following requirements:

1. Read the input CSV file
4. Skip rows with invalid email addresses
5. Output a new CSV with cleaned data

### `Contact` class

The contact class includes:

- storing the `name` field
- storing the `email` field
- storing the `phone` field
- validating the `email` field
- cleaning the `phone` field data

It can meet the following requirements:

2. Clean the phone numbers (remove dashes, dots, spaces - keep only digits)
3. Validate email addresses (basic check - must contain @ and a dot)

### Addressing the requirements

#### 1. Read the input CSV file

The `ContactList` class' method `#load_contacts_from_csv_file` will receive a string argument for the input CSV file path, open the CSV file, then read each row of data into an instance of the `Contact` class that will be stored in an array for the list.

#### 2. Clean the phone numbers (remove dashes, dots, spaces - keep only digits)

The `Contact` class' method `#clean_phone` will remove non-digit characters from the `phone` attribute and return only the numbers as a string.

#### 3. Validate email addresses (basic check - must contain @ and a dot)

The `Contact` class' method `#valid_email?` will check if the `email` attribute contains both `@` and `.` characters and return `true` if it does otherwise will return `false`.

#### 4. Skip rows with invalid email addresses

The `ContactList` class will include a look to check each of the contacts, process each row of data and use the `valid_email?` method to validate the email address and if it returns `false` then skips that contact.

#### 5. Output a new CSV with cleaned data

The `ContactList` class' method `#save_contacts_to_csv_file` will receive a string argument for the output CSV file path, create the CSV file, and write the valid contacts with the `name`, `email`, and `#clean_phone` data.

## Run the app

Using the version of Ruby defined in `.ruby-version` run the terminal command `bundle install`.

To use the contact list processor app start an `irb` session in your terminal then use the methods to load and save the contacts to files. See the example below:

```rb
$ irb
irb(main):001> require_relative 'app/contact_list'
=> true
irb(main):002> contact_list = ContactList.new
=> #<ContactList:0x000000012201e960 @contacts=[]>
irb(main):003> contact_list.load_contacts_from_csv_file('spec/fixtures/input.csv')
=>
[#<Contact:0x00000001244dc7c0 @email="john@email.com", @name="John Doe", @phone="123-456-7890">,
 #<Contact:0x00000001244dc4a0 @email="jane@email.com", @name="Jane Smith", @phone=nil>,
 #<Contact:0x00000001244dc1d0 @email="bob@invalid-email", @name="Bob Johnson", @phone="555.123.4567">,
 #<Contact:0x00000001244dbeb0 @email="mary@email.com", @name="Mary Davis", @phone="1234567890">]
irb(main):004> contact_list.save_contacts_to_csv_file('spec/fixtures/output.csv')
=> true
```

## Run the tests

To run the automated tests run the terminal command `bundle exec rspec`.

```
$ bundle exec rspec

ContactList
  #initialize
    sets the contacts instance variable to an empty array
  #load_contacts_from_csv_file
    reads the input CSV file and for each row adds an instance of Contact with the name, email and phone data to the contacts array
  #save_contacts_to_csv_file
    saves the valid contacts to the specified CSV file with clean phone number

Contact
  #initialize
    when name, email, and phone data are not present
      the name, email, and phone attributes return nil
    when name, email, and phone arguments are present
      sets the name, email and phone attributes to the values
  #valid_email?
    when email is nil
      returns false
    when email contains @ but not .
      returns false
    when email contains . but not @
      returns false
    when email contains both . and @
      returns true
  #clean_phone
    when phone is nil
      returns nil
    when phone contains a mix of numbers and non-digit characters
      returns only the number characters

Finished in 0.00474 seconds (files took 0.06579 seconds to load)
11 examples, 0 failures
```
