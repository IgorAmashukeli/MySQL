/*
Since when adding additional points, applicants for each educational program may not follow in descending order of total points, it is necessary to create a new applicant_order table based on the applicant_order table. When creating the table, the data must be sorted first by the id of the educational program, then in descending order of the final score. 
And the applicanttable, which was created as an auxiliary table, must be deleted.
*/

CREATE TABLE applicant_order (
    SELECT * FROM applicant
    ORDER BY program_id, itog DESC
);

DROP TABLE applicant;