![](https://assets-global.website-files.com/5b69e8315733f2850ec22669/5b749a4663ff82be270ff1f5_GSC%20Lockup%20(Orange%20%3A%20Black).svg)

### Welcome to the take home portion of your interview! We're excited to jam through some technical stuff with you, but first it'll help to get a sense of how you work through data and coding problems. Work through what you can independently, but do feel free to reach out if you have blocking questions or problems.

1) This requires Postgres (9.4+) & Rails(4.2+), so if you don't already have both installed, please install them.
    #### Jake's work
    - Repo name: `street_cafes`  
    - Uses Ruby version 2.5.3, Rails version 5.2.4.5  
2) Download the data file from: https://github.com/gospotcheck/ps-code-challenge/blob/master/Street%20Cafes%202020-21.csv

3) Add a varchar column to the table called `category`. 

4) Create a view with the following columns[provide the view SQL]
    - post_code: The Post Code
    - total_places: The number of places in that Post Code
    - total_chairs: The total number of chairs in that Post Code
    - chairs_pct: Out of all the chairs at all the Post Codes, what percentage does this Post Code represent (should sum to 100% in the whole view)
    - place_with_max_chairs: The name of the place with the most chairs in that Post Code
    -max_chairs: The number of chairs at the place_with_max_chairs
	
    *Please also include a brief description of how you verified #4*
    #### Jake's work
    - View path: `'/post_code_data'`
    - This data was verified via tests in both filepaths: `'street_cafes/spec/features/post_code_data/index_spec'` (integration level) & `'street_cafes/spec/poros/post_code_spec'` (unit level). PORO methods are fully tested at both unit and integration levels (using SimpleCov to ensure 100% testing coverage) to verify that data provided is accurate and displayed correctly in the view.

5) Write a Rails script to categorize the cafes and write the result to the category according to the rules:[provide the script]
    - If the Post Code is of the LS1 prefix type:
        - `# of chairs less than 10: category = 'ls1 small'`
        - `# of chairs greater than or equal to 10, less than 100: category = 'ls1 medium'`
        - `# of chairs greater than or equal to 100: category = 'ls1 large' `
    - If the Post Code is of the LS2 prefix type: 
        - `# of chairs below the 50th percentile for ls2: category = 'ls2 small'`
        - `# of chairs above the 50th percentile for ls2: category = 'ls2 large'`
    - For Post Code is something else:
        - `category = 'other'`

    *Please share any tests you wrote for #5*
    #### Jake's work
    - The categorize script is called in the categories controller create action. The method is clickable from a button on the root path, which will categorize all StreetCafe records and redirect you to the `'/categories'` view.
    - I wrote 1 test for this, located in `'street_cafes/spec/features/welcome_spec'`. The test data creates enough cafes to fall into every category type. The cafes are tested to ensure there is no category prior to running the script. Then each cafe is tested to ensure the the correct category has been added.
    - For categorizing LS2, there was no explicit instructions for when an odd number produces a number right at the 50th percentantile, so I made a decision and put it with those below the 50th percentile. Typically this is something I would ask for clarification on, but for this project I made the executive decision.

6) Write a custom view to aggregate the categories [provide view SQL AND the results of this view]
    - category: The category column
    - total_places: The number of places in that category
    - total_chairs: The total chairs in that category

    #### Jake's work
    - View path: `'/categories'`
    This data was verified via tests in both filepaths: `'street_cafes/spec/features/categories/index_spec'` (integration level) & `'street_cafes/spec/poros/category'` (unit level). PORO `attr_reader` methods are fully tested at both unit and integration levels (using SimpleCov to ensure 100% testing coverage) to verify that data provided is accurate and displayed correctly in the view.

7) Write a script in rails to:
    - For street_cafes categorized as small, write a script that exports their data to a csv and deletes the records
    - For street cafes categorized as medium or large, write a script that concatenates the category name to the beginning of the name and writes it back to the name column
	
    *Please share any tests you wrote for #7*
    #### Jake's work
    - The script to reorganize the data can be called in with the Reorganize Cafe Data button in the root view. This will call the StreetCafe destroy action and trigger the exportation of data to a csv file, destroying small category data, then updating medium and large category data while leaving other category data alone.
    - I tested this in the path: `'street_cafes/spec/features/welcome_spec'`. Each category type is tested to ensure proper functioning, with destroyed records expected to raise exception.
    - Overall this was a fun a challenging project. The nature of the design made it difficult to follow normal REST conventions, but I tried getting a little creative in that regard.
    - I am happy to discuss my design decisions with you as well as changes I would make if I had more time--Turing's demanding 80/hrs week made it hard to refactor fully for this challenge.

8) Show your work and check your email for submission instructions.

9) Celebrate, you did great! 


