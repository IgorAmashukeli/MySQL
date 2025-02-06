/*
Worrying that it is not safe to store customer data in a readable form, it was decided to "encrypt" the client table data with a primitive algorithm, 
namely the name_client fields (i.e. customer names) and email (email addresses).
(see screenshot below)

The algorithm is quite simple.
We will "encrypt" it as follows:

1. We will encode the values of these fields using the Base64 encoding standard.
Base64 is a data encoding standard.
You can read more details on Wikipedia (for example).
To put it simply, this is one of the ways to hide our original data behind a set of characters.
MySQL has a function: TO_BASE64(to_field name or empty text) 
It will return the encoded text as a result.
For example:
Pavel Baranov in encoded form will look like:
0JHQsNGA0LDQvdC+0LIg0J/QsNCy0LXQuw==

2. But, simple encoding in Base64 is not enough, and it was decided to flip the field values horizontally.
That is, if Pavel Baranov in Base64 looked like: 0JHQsNGA0LDQvdC+0LIg0J/QsNCy0LXQuw== 
then, inverted, it will look like this: ==wuQXL0yCNsQ/J0gIL0+CdvQDL0AGNsQHJ0,
i.e. we just expanded the string in the opposite direction.
MySQL has a function: REVERSE(there is a field name or a plaintext)
It just allows you to flip the line horizontally.

Thus, you need to update the client table by encoding the values of the required fields.

Finally, we need to somehow receive our data in decoded form during sampling.
It is necessary to write a selection query that will output data from the client table in its original form.
Let me tell you that you will need the CONVERT() FROM_BASE64() REVERSE() functions.
You can read about the previously mentioned functions on the Internet.
*/



UPDATE 
  client 
SET 
  name_client = REVERSE(
    TO_BASE64(name_client)
  ), 
  email = REVERSE(
    TO_BASE64(email)
  );
SELECT 
  * 
FROM 
  client;
SELECT 
  client_id, 
  CONVERT(
    FROM_BASE64(
      REVERSE(name_client)
    ), 
    NCHAR
  ) As name_client, 
  CONVERT(
    FROM_BASE64(
      REVERSE(email)
    ), 
    NCHAR
  ) AS email 
FROM 
  client;