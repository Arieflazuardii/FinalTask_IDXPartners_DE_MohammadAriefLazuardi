# VIX-DataEngineer-Test

##Project Based Virtual Internship Program --- Data Engineer Rakamin Academy x ID/X Partners

### Case Study

One of ID/X Partners' clients, which is engaged in e-commerce, has a need to create a Data e-commerce has a need to create a Data Warehouse derived from several tables from the source database. This Data Warehouse will consist of one Fact table and several Dimension tables. several Dimension tables.

### Solution Plan

Creating a Data Warehouse for the needs of one of ID / X Partners' clients engaged in the e-commerce sector.

As a Data Engineer, I do several things, which are:

1. Import/Restore the Staging Database.
2. Create a Database named DWH_Project, and create Fact and Dimension tables from the tables in the Staging database.
3. Create an ETL Job in the talend application to move the
   data from Staging to Data Warehouse. Especially for Table
   DimCustomer table, transform the data by changing the data from the
   data from the FirstName and LastName columns into capital letters
   and then merge the two columns into one column called CustomerName.
   column called CustomerName.
4. Create a Store Procedure (SP) to display
   sales order summary based on delivery status.
