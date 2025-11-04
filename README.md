# Tech Test - Ruby CSV Contact List Processor

Tech test in Ruby to process a contacts list from a CSV file including validating and cleaning the data.

For the summary of the answer see [/SOLUTION.md](/SOLUTION.md).

### Task description

**Task**: Simple Contact List Processor

**Scenario**: You have a CSV file containing contact information that needs to be
cleaned and reformatted.

Take the Input CSV Format section and copy that into a file called 'input.csv' before
we start the mock interview. The Expected Output section is just there to show you
what the end result should look like.

Input CSV Format:

```csv
name,email,phone
John Doe,john@email.com,123-456-7890
Jane Smith,jane@email.com,
Bob Johnson,bob@invalid-email,555.123.4567
Mary Davis,mary@email.com,1234567890
```

### Requirements

1. Read the input CSV file
2. Clean the phone numbers (remove dashes, dots, spaces - keep only digits)
3. Validate email addresses (basic check - must contain @ and a dot)
4. Skip rows with invalid email addresses
5. Output a new CSV with cleaned data

Expected Output:

```csv
name,email,clean_phone
John Doe,john@email.com,1234567890
Jane Smith,jane@email.com,
Mary Davis,mary@email.com,1234567890
```

### Pair Programming Areas to Demonstrate

#### 1. Thinking Out Loud

- "I'll start by requiring the CSV library..."
- "Let me think about how to validate an email address..."
- "I should handle the case where phone is empty..."

#### 2. Asking Clarifying Questions

- "What should I do with empty phone numbers?"
- "How strict should the email validation be?"
- "Should I preserve the original column order?"

#### 3. Explaining Approach

- "My plan is to read the CSV, process each row, then write the output"
- "I'll create a method to clean phone numbers separately"
- "Let me validate this step by step"

#### 4. Handling Issues

- "This isn't working as expected, let me debug..."
- "I'm not sure about this syntax, let me check..."
- "What do you think about this approach?"

#### 5. Discussing Improvements

- "With more time, I'd add better error handling"
- "In production, I'd add logging and more robust validation"
- "I could make this more efficient for larger files"

### Coaching Points During Pair Programming

#### Encourage

- Constant verbalization of thought process
- Questions about edge cases and requirements
- Explaining why they're making certain choices
- Testing small pieces before building the full solution
- Acknowledging when stuck and working through it out loud

#### Gently Correct

- Silent coding - "Tell me what you're thinking"
- Diving too deep without explaining - "What's your overall approach here?"
- Not asking questions - "Are you making any assumptions I should know
  about?"
- Getting frustrated - "This is exactly how real programming works - let's
  debug this together"

### Success Indicators

- ✅ They explain their approach before coding
- ✅ They ask clarifying questions
- ✅ They verbalize their thought process
- ✅ They handle unexpected issues gracefully
- ✅ They collaborate rather than just code alone
- ✅ They discuss potential improvements
