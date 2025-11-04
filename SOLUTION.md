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
