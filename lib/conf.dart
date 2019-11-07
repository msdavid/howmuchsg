library conf;

const  TEXT_TITLE = 'HowMuch - SG 2019';
const  TEXT_SALARY = 'Basic monthly salary as in IPA';
const  TEXT_DAYS_PER_WEEK = 'Days per Week';
const  INPUT_PATTERN = '[1234567890.]';
const  DEFAULT_DAYS_PER_WEEK = 5.5;
const  URL_DAILY = 'https://sso.agc.gov.sg/Act/EmA1968#pr107A-';
const  URL_HOURLY = 'https://sso.agc.gov.sg/Act/EmA1968#Sc4-';
const  URL_OVERTIME = 'https://sso.agc.gov.sg/Act/EmA1968#pr38-';
const  URL_RESTDAY = 'https://sso.agc.gov.sg/Act/EmA1968#pr37-';
const  URL_PUBLIC_HOLIDAY = 'https://sso.agc.gov.sg/Act/EmA1968#pr88-';

const  TEXT_LAW_DAILY = 'Section 107A (2) of Employment Act (CHAPTER 91)';
const  TEXT_LAW_HOURLY = 'Forth Schedule of Employment Act (CHAPTER 91)';
const  TEXT_LAW_OVERTIME = 'Section 38 (4) of Employment Act (CHAPTER 91)';
const  TEXT_LAW_RESTDAY = 'Section 37 (3) of Employment Act (Work on Rest day at employer’s request) (CHAPTER 91) ';
const  TEXT_LAW_PUBLIC_HOLIDAY = 'Section 88 (4) of Employment Act (CHAPTER 91)';

const  LAW_TITLE_DAILY = 'Daily';
const  LAW_TITLE_HOURLY = 'Hourly';
const  LAW_TITLE_OVERTIME = 'Overtime (per hour)';
const  LAW_TITLE_RESTDAY = 'Restday';
const  LAW_TITLE_PUBLIC_HOLIDAY = 'Public Holiday (per day)';

const  TITLE_DAILY = 'Daily';
const  TITLE_HOURLY = 'Hourly';
const  TITLE_OVERTIME = 'Overtime';
const  TITLE_RESTDAY = 'Restday';
const  TITLE_PUBLIC_HOLIDAY = 'Public Holiday';

const  FORMULA_DAILY = '(%monthlySalary x 12 month) / (52 weeks x %daysPerWeek days)';
const  FORMULA_HOURLY = '(%monthlySalary x 12 month) / (52 weeks x 44 hours)';
const  FORMULA_OVERTIME = '%hourly per-hour x 1.5';
const  FORMULA_RESTDAY = '%daily per-day x 2';
const  FORMULA_PUBLIC_HOLIDAY = '(%monthlySalary x 12 month) / (52 weeks x %daysPerWeek days)';

const  TEXT_DISCLAIMER =
    "The information contained in​ this application is for general information " 
    "purposes only. The author assumes no responsibility for errors and/or omissions "
    "and reserves the right to make additions, deletions, or modification at any time "
    "without prior notice";
