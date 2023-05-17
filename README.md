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

![ERD Schema](/Resources/ERD.png)

### Machine Learning
We are using a basic gradient boosting classifer method to see which learning rate we can expect the best results from. As seen in the picture below, we have the highes validation accuracy score at 0.1 learning rate. Even thought the higher training levels have a higher training accuracry score, it is getting to seperated from the validation accuarcy score. This is most likely caused by over fitting and we have decided to go with 0.1 since it has the closes training and validation accuracy scores, implying that this learning rate is not overfitted.


However, as seen with the confusion matrix we have a relitivly high False Negatives causing us to have a low recall (sensitivity) rate. And when concerning coronary heart disease, it is extremly important to have a good sensitivity rate. We will need to look into raising our sensitivy rate to an acceptable standard.
