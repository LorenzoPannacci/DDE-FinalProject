*Encode nation into numeric id
encode(nation) , gen(numeric_Nation)

* set the panel data
xtset numeric_Nation year

* Exploratory Data Analysis
gen ProportionNewMarriages = marriages/population
gen ProportionNewDivorces = divorces/population


* Proportion of new marriages 
twoway (line  ProportionNewMarriages year, sort), by(numeric_Nation, col(5) note(""))

* Proportion of new divorces 
twoway (line  ProportionNewDivorces year, sort), by(numeric_Nation, col(5) note(""))



* Scatterplot marriages vs independent variables
twoway scatter marriages birth_rate, name(scatter1, replace)
twoway scatter marriages fertility_rate, name(scatter2, replace)
twoway scatter marriages m_employment_rate, name(scatter3, replace)
twoway scatter marriages f_employment_rate, name(scatter4, replace)
twoway scatter marriages f_mean_income, name(scatter5, replace)
twoway scatter marriages m_mean_income, name(scatter6, replace)
twoway scatter marriages n_repro_female, name(scatter7, replace)
twoway scatter marriages gdp, name(scatter8, replace)
twoway scatter marriages employment_gender_gap, name(scatter9, replace)
twoway scatter marriages closing_housing_price, name(scatter10, replace)
twoway scatter marriages mean_age_childbearing, name(scatter11, replace)
twoway scatter marriages demand_for_family, name(scatter12, replace)


graph combine scatter1 scatter2 scatter3 scatter4 scatter5 scatter6 scatter7 scatter8 scatter9 scatter10 scatter11 scatter12///
    title("Marriages and Independent Variables") col(4)





* Scatterplot divorces vs independent variables
twoway scatter divorces birth_rate, name(scatter1, replace)
twoway scatter divorces fertility_rate, name(scatter2, replace)
twoway scatter divorces m_employment_rate, name(scatter3, replace)
twoway scatter divorces f_employment_rate, name(scatter4, replace)
twoway scatter divorces f_mean_income, name(scatter5, replace)
twoway scatter divorces m_mean_income, name(scatter6, replace)
twoway scatter divorces n_repro_female, name(scatter7, replace)
twoway scatter divorces gdp, name(scatter8, replace)
twoway scatter divorces employment_gender_gap, name(scatter9, replace)
twoway scatter divorces closing_housing_price, name(scatter10, replace)
twoway scatter divorces mean_age_childbearing, name(scatter11, replace)
twoway scatter divorces demand_for_family, name(scatter12, replace)



graph combine scatter1 scatter2 scatter3 scatter4 scatter5 scatter6 scatter7 scatter8 scatter9 scatter10 scatter11 scatter12, col(4)



* Generate dummy variables of year for OLS and/or FIRST DIFFERENTIETING MODEL
tabulate year, generate(year_dummy)


* Pooled OLS

reg marrieges_log birth_rate n_repro_female f_employment_rate f_mean_income fertility_rate gdp closing_housing_price m_employment_rate m_mean_income mean_age_childbearing demand_for_family percentage_female_work_home percentage_male_work_home consumer_price_harmonized_index year_dummy2 year_dummy3 year_dummy4 year_dummy5 year_dummy6 year_dummy7 year_dummy8 year_dummy9 year_dummy10 year_dummy11 year_dummy12 year_dummy13 year_dummy14


* Complete FE no robust

xtreg marrieges_log birth_rate n_repro_female f_employment_rate f_mean_income fertility_rate gdp closing_housing_price m_employment_rate m_mean_income mean_age_childbearing demand_for_family percentage_female_work_home percentage_male_work_home consumer_price_harmonized_index, fe


* Final FE no robust

xtreg marrieges_log birth_rate n_repro_female gdp m_employment_rate percentage_female_work_home consumer_price_harmonized_index , fe



# f mean age

xtreg marrieges_log birth_rate n_repro_female gdp m_employment_rate percentage_female_work_home consumer_price_harmonized_index , fe
xtreg marriages birth_rate n_repro_female gdp m_employment_rate percentage_female_work_home consumer_price_harmonized_index, fe


xtreg marriages_log birth_rate n_repro_female gdp m_employment_rate percentage_female_work_home consumer_price_harmonized_index f_mean_age_marriage demand_for_family employment_gender_gap, fe

xtreg log_tot_f_married_in_repro_age birth_rate m_mean_income mean_age_childbearing population demand_for_family f_mean_age_marriage tertiary_ed_m, fe


#########

xtreg marriages_log birth_rate n_repro_female gdp m_employment_rate percentage_female_work_home consumer_price_harmonized_index f_mean_age_marriage employment_gender_gap, fe

xtreg marriages_log birth_rate n_repro_female gdp m_employment_rate percentage_female_work_home consumer_price_harmonized_index f_mean_age_marriage demand_for_family, fe

###

xtreg marriages_log birth_rate n_repro_female gdp m_employment_rate percentage_female_work_home consumer_price_harmonized_index f_mean_age_marriage year_dummy3 year_dummy5 year_dummy11 year_dummy12 year_dummy13, re





xtreg marriages_log birth_rate n_repro_female gdp m_employment_rate f_employment_rate percentage_female_work_home consumer_price_harmonized_index f_mean_age_marriage year_dummy7 year_dummy8 year_dummy9, fe




