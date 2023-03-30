select * from employee_attrition;

# Details of employee under attrition having 5+ years of experiance in between the age group of 27-35
select * from  employee_attrition
where age between 27 and 35
and totalworkingyears >=5;

#details of employee having  max and min salary working in different departments who recives less than 13% salary hike
select Department,max(monthlyIncome),min(MonthlyIncome) from employee_attrition
where PercentSalaryHike > 13 
group by Department;

select Department,percentsalaryhike,
max(MonthlyIncome),min(MonthlyIncome) from empolyee_attrition
group by Department
having percentsalaryhike < 13
order by max(MonthlyIncome) desc;

# calculate the avg  Monthly income of  all the employee who worked more than 3 years whose education background is medical
select  avg(MonthlyIncome) from employee_attrition
where TotalWorkingYears > 3 and EducationField = 'Medical' group by EducationField;

#Identitfy the Total no of male and female  employee under attrition  whose martial status is married and haven't recevied promotion in the last 2 years
select gender,count(Employee_Id)
from employee_attrition
where MaritalStatus = 'Married'
and YearsSinceLastPromotion = 2
group  by gender;

#employee with max performance rating but no promotion for 4 years and score
select * from employee_attrition
where PerformanceRating = (select max(PerformanceRating) from employee_attrition)
and YearsSinceLastPromotion >=4;

# max  and min salary hike
select YearsAtCompany,performancerating,YearsSinceLastPromotion,
max(percentsalaryhike),
min(percentsalaryhike)
from employee_attrition
group by YearsAtCompany,performancerating,YearsSinceLastPromotion
order by max(PercentSalaryHike) desc,min(PercentSalaryHike) asc;

#employee working overtime but given min salary and more then 5 years with comapny
select * from employee_attrition
where overtime = 'YES'
and PercentSalaryHike = (select min(PercentSalaryHike) from employee_attrition)
and YearsAtCompany >5;

#employee working overtime  given max salary and less then 5 years with comapny
select * from employee_attrition
where overtime = 'Yes'
and PercentSalaryHike = (select max(PercentSalaryHike) from employee_attrition)
and YearsAtCompany < 5;

#employee not working overtime but given max salary and less then 5 years with comapny
select * from employee_attrition
where overtime = 'No'
and PercentSalaryHike = (select max(PercentSalaryHike) from employee_attrition)
and YearsAtCompany < 5;

#max satisfaction on the basis of  relationshipstatus
select MaritalStatus,max(RelationshipSatisfaction),min(RelationshipSatisfaction)
from employee_attrition
group by MaritalStatus;


