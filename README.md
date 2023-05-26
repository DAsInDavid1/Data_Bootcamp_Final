# Data_Bootcamp_Final

### Selected topic
Predicting the 10-year risk of future coronary heart disease (CHD) using demographic and health data 

### Reason for selecting this topic

We decided to choose a healthcare-related topic because of its potential in the job market for data scientists and because we thought other teams were not planning to choose this area. After considering several other possible data sources, such as Hospital ratings, Drug Classification, Drug Use By Age, and Health Insurance Marketplace, we ruled those out due to the small sample size or absence of endpoint data for model testing. We ultimately selected data related to coronary heart disease (CHD) in order to gain a better understanding of the factors that contribute to its development. Our goal is to explore the potential of using machine learning algorithms to predict the likelihood of a patient developing CHD in the next ten years based on their health information.

### Description of the source data

The Framingham Heart Study dataset consists of 4,240 records with 15 attributes, including demographic information such as gender, age, education, smoking behavior, medical history including blood pressure medication, stroke, hypertension, and diabetes, as well as clinical measurements such as cholesterol levels, BMI, heart rate, and glucose levels. This dataset aims to predict the 10-year risk of developing coronary heart disease (CHD) based on the available data.

### Question we hope to answer with the data

Can demographic information such as age, gender, and health-related data such as smoking status, blood pressure, and cholesterol levels be used to predict the likelihood of developing coronary heart disease (CHD) in the next ten years?


### Communication Protocols
To ensure effective communication within our team, we have established the following protocols. We will primarily use Slack for all day-to-day communications and updates related to the project. Additionally, we will hold weekly meetings on Sundays to discuss progress, address any issues, and plan for the upcoming week. During these meetings, we will review individual and collective goals and ensure everyone is on the same page. We believe that these communication protocols will help us stay organized, track our progress, and complete the project successfully.

### Data Exploration and Preparation
We split the data into three tables. One containing categorical variables with characteristics of the patients (DEMOG), continuous measures (MEASURES), and categorical variables of medical history/symptoms (COMORBIDITIES). We started the data exploration with the DEMOG data. 53 rows (patients) of the 4240 rows in the raw data had BPMeds=NA and 50 rows had TotChol=NA. We dropped those rows from the analysis data, leaving 4138 rows for analysis. We decided not to use Education and Glucose in the analysis because of the large percentage of missing values. After dropping the rows with BMI or heartrate =NA, that left 4119 rows for analysis. The only other variable that needed to be addressed for missing data was cigsperday. For currentsmoker=1(Yes), we replaced 29 NAs with the mean value 18.

![ERD Schema](/Resources/ERD/ERD.png)

### Machine Learning

#### Initial Machine Learning Phase
We are using a basic gradient boosting classifer method to see which learning rate we can expect the best results from. As seen in the picture below, we have the highes validation accuracy score at 0.1 learning rate. Even though the higher training levels have a higher training accuracry score, it is getting to seperated from the validation accuracy score. This is most likely caused by over fitting and we have decided to go with 0.1 since it has the closest training and validation accuracy scores, implying that this learning rate is not overfitted.

<img src= "https://github.com/DAsInDavid1/Data_Bootcamp_Final/blob/main/Pictures/Learning_rates.png" width=25% height=25%> 

However, as seen with the confusion matrix we have a relatively high False Negatives causing us to have a low recall (sensitivity) rate. And when concerning coronary heart disease, it is extremely important to have a good sensitivity rate. We will need to look into raising our sensitivity rate to an acceptable standard.

| Confusion Matrix  | Classification Report 
| ------------- | ------------- 
| <img src= "https://github.com/DAsInDavid1/Data_Bootcamp_Final/blob/main/Pictures/Confusion_Matrix_1.png" width=100% height=100%>   | <img src= "https://github.com/DAsInDavid1/Data_Bootcamp_Final/blob/main/Pictures/Classification_report_1.png" width=100% height=100%>   

#### Secondary Phase, Choosing a Best Model
After getting the framework for a machine learning model into place, we tested 3 more different models to see which one would give us the best base score we were looking for. The condition was a higher sensititivy score, along with a reasonable accuracy score of somewhere above 60%.

| Gradient Boosting Classifier  | Decision Tree 
| ------------- | -------------    
| <img src= "https://github.com/DAsInDavid1/Data_Bootcamp_Final/blob/main/Pictures/Classification_report_1.png" width=120% height=120%>   | <img src= "https://github.com/DAsInDavid1/Data_Bootcamp_Final/blob/main/Pictures/Decision_Tree_Clasfication_Report.png" width=100% height=100%>    

| Logistical Regression | K-Nearest Neighbors
| ------------- | ------------- 
| <img src= "https://github.com/DAsInDavid1/Data_Bootcamp_Final/blob/main/Pictures/Logistical_Regression_Clasfication_Report.png" width=130% height=130%>  | <img src= "https://github.com/DAsInDavid1/Data_Bootcamp_Final/blob/main/Pictures/KNN_Classification_Report.png" width=100% height=100%>  

As seen in the pictures above, the highest accuracy was the logistical regression, however it still had an extremely low recall rate for 1 (the patient will have a heart disease). The decision tree was better with still a high accuracy score, but the KNN Model had a better recall and accuracy score overall. We decided to move forward with this model and try to increase the quality of our machine learning model using other techniques.

The first technique we looked into was SMOTEENN, which allowed us to oversample the 1's and then get rid of the outliers and any that overlapped with the 0's. This gave us a much more even analysis and kept it from being scewed to one side.

With SMOTEENN, our new accuracy score was lowered, however, we believe it was worth it to get our sensitivity rate up for 1's.

We moved on to looking to alter our columns to see if we can increase our scores by dropping certain columns. After testing of dropping individual columns, we found that by dropping the "heartrate" column we were able to increase our scores in every category. We tested dropping other columns with "heartrate" and found that "diabetes" also had a positive impact on our machine learning model once it was dropped.

| KNN & SMOTEENN | Dropping "heartrate" | Dropping "heartrate" and "diabetes"
| ------------- | ------------- | -------------
| <img src= "https://github.com/DAsInDavid1/Data_Bootcamp_Final/blob/main/Pictures/KNN_Classification_Report_SMOTEENN.png" width=90% height=90%> | <img src= "https://github.com/DAsInDavid1/Data_Bootcamp_Final/blob/main/Pictures/KNN_Classification_Report_SMOTEENN_HeartRate.png" width=100% height=100%> | <img src= "https://github.com/DAsInDavid1/Data_Bootcamp_Final/blob/main/Pictures/KNN_Classification_Report_SMOTEENN_HeartRate_Diabetes.png" width=900% height=90%>

As seen we have made continuous improvements to the model and hope to have it above 70% accuracy with a recall rate of above 65% weighted avg by the end.

### Tableau Dashboard

https://public.tableau.com/app/profile/armando.molina/viz/FinalProject_16848673704810/Story1?publish=yes

