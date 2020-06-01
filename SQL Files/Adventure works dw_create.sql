--
-- ER/Studio Data Architect SQL Code Generation
-- Project :      Model2.DM1
--
-- Date Created : Monday, February 24, 2020 14:27:47
-- Target DBMS : MySQL 5.x
--

-- 
-- TABLE: dim_rejectcodes 


CREATE TABLE dim_rejectcodes(
    DI_Reject_SK            INT            AUTO_INCREMENT,
    DI_RejectCode           INT            NOT NULL,
    DI_RejectReason         CHAR(80),
    DI_RejectDescription    CHAR(255),
    SOR_ID                  INT,
    DI_Job_ID               VARCHAR(20)    NOT NULL,
    DI_Create_Date          DATETIME        NOT NULL,
    DI_Modified_Date        DATETIME        NOT NULL,
    PRIMARY KEY (DI_Reject_SK)
)ENGINE=MYISAM
;



-- 
-- TABLE: dim_sorsystem 
--


CREATE TABLE dim_sorsystem(
    SOR_ID              INT             NOT NULL,
    SOR_Name            CHAR(20),
    SOR_Description     CHAR(80),
    SOR_Type            VARCHAR(80),
    SOR_DBMS            VARCHAR(80),
    SOR_DBName          VARCHAR(80),
    SOR_DBSchema        VARCHAR(80),
    SOR_FileType        VARCHAR(80),
    SOR_Filename        VARCHAR(255),
    SOR_AppName         VARCHAR(255),
    SOR_AppModule       VARCHAR(255),
    DI_Job_ID           VARCHAR(20),
    DI_Create_Date      DATETIME         NOT NULL,
    DI_Modified_Date    DATETIME         NOT NULL,
    PRIMARY KEY (SOR_ID)
)ENGINE=MYISAM
;



-- 
-- TABLE: dimcustomerperson 
--

CREATE TABLE dimcustomerperson(
    CustomerSK             INT             AUTO_INCREMENT,
    GeoSK                  INT,
    CustomerAlternateSK    VARCHAR(15)     NOT NULL,
    FirstName              VARCHAR(50),
    MiddleName             VARCHAR(50),
    LastName               VARCHAR(50),
    BirthDate              DATE,
    Gender                 VARCHAR(1),
    EmailAddress           VARCHAR(50),
    AddressLine1           VARCHAR(120),
    AddressLine2           VARCHAR(120),
    Phone                  VARCHAR(20),
    DateFirstPurchase      DATE,
    SOR_ID                 INT,
    SOR_LoadDate           DATETIME,
    SOR_UpdateDate         DATETIME,
    DI_Job_ID              VARCHAR(20)     DEFAULT 'no_job_id' NOT NULL,
    DI_Create_Date         DATETIME        NOT NULL,
    DI_Modified_Date       DATETIME        NOT NULL,
    PRIMARY KEY (CustomerSK)
)ENGINE=MYISAM
;



-- 
-- TABLE: dimdate 
--

CREATE TABLE dimdate(
    DateSK               INT            NOT NULL,
    FullDateAK           DATE           NOT NULL,
    DayNumberOfWeek      INT            NOT NULL,
    DayNameOfWeek        VARCHAR(10)    NOT NULL,
    DayNameOfWeekAbbr    VARCHAR(3)     NOT NULL,
    DayNumberOfMonth     INT            NOT NULL,
    DayNumberOfYear      INT            NOT NULL,
    WeekNumberOfYear     INT            NOT NULL,
    MonthName            VARCHAR(10)    NOT NULL,
    MonthNameAbbr        VARCHAR(3)     NOT NULL,
    MonthNumberOfYear    INT            NOT NULL,
    CalendarQuarter      INT            NOT NULL,
    CalendarYear         INT            NOT NULL,
    DI_Job_ID            VARCHAR(20)    NOT NULL,
    DI_Create_Date       DATETIME        NOT NULL,
    DI_Modified_Date     DATETIME       NOT NULL,
    SOR_ID               INT,
    PRIMARY KEY (DateSK)
)ENGINE=MYISAM
;



-- 
-- TABLE: dimemployee 
--

CREATE TABLE dimemployee(
    EmployeeSK            INT               AUTO_INCREMENT,
    BusinessEntityID      INT               NOT NULL,
    EmployeeNationalID    VARCHAR(15),
    GeoSK                 INT,
    SalesTerritorySK      INT,
    AddressLine1          VARCHAR(60),
    AddressLine2          VARCHAR(60),
    AddressType           VARCHAR(50),
    Purchase_Buyer        INT               DEFAULT 0 NOT NULL,
    FirstName             VARCHAR(50)       NOT NULL,
    LastName              VARCHAR(50)       NOT NULL,
    MiddleName            VARCHAR(50),
    HireDate              DATE,
    BirthDate             DATE,
    EmailAddress          VARCHAR(50),
    Phone                 VARCHAR(25),
    SalariedFlag          INT,
    Gender                CHAR(1),
    PayFrequency          INT,
    BaseRate              DECIMAL(15, 2),
    CurrentFlag           INT               NOT NULL,
    SalesPersonFlag       INT               NOT NULL,
    DepartmentName        VARCHAR(50),
    StartDate             DATE,
    EndDate               DATE,
    Status                VARCHAR(50),
    SOR_ID                INT,
    SOR_LoadDate          DATETIME,
    SOR_UpdateDate        DATETIME,
    DI_Job_ID             VARCHAR(20)       NOT NULL,
    DI_Create_Date        DATETIME          NOT NULL,
    DI_Modified_Date      DATETIME           NOT NULL,
    PRIMARY KEY (EmployeeSK)
)ENGINE=MYISAM
;



-- 
-- TABLE: dimgeography 
--

CREATE TABLE dimgeography(
    GeoSK                      INT            AUTO_INCREMENT,
    City                       VARCHAR(30),
    StateProvinceCode          VARCHAR(3),
    StateProvinceName          VARCHAR(50),
    IsOnlyStateProvinceFlag    INT,
    CountryRegionCode          VARCHAR(3),
    CountryRegionName          VARCHAR(50),
    PostalCode                 VARCHAR(15),
    SalesTerritorySK           INT,
    SOR_ID                     INT,
    SOR_LoadDate               DATETIME,
    SOR_UpdateDate             DATETIME,
    DI_Job_ID                  VARCHAR(20)    NOT NULL,
    DI_Create_Date             DATETIME        NOT NULL,
    DI_Modified_Date           DATETIME        NOT NULL,
    PRIMARY KEY (GeoSK)
)ENGINE=MYISAM
;



-- 
-- TABLE: dimlocation 
--

CREATE TABLE dimlocation(
    LocationSK          INT               AUTO_INCREMENT,
    LocationID          INT               NOT NULL,
    LocationName        VARCHAR(50)       NOT NULL,
    CostRate            DECIMAL(15, 2)    NOT NULL,
    Availability        DECIMAL(8, 2)     NOT NULL,
    ModifiedDate        DATETIME          NOT NULL,
    SOR_ID              INT,
    SOR_LoadDate        DATETIME,
    SOR_UpdateDate      DATETIME,
    DI_Job_ID           VARCHAR(20)       NOT NULL,
    DI_Create_Date      DATETIME           NOT NULL,
    DI_Modified_Date    DATETIME           NOT NULL,
    PRIMARY KEY (LocationSK)
)ENGINE=MYISAM
;



-- 
-- TABLE: dimpayhistory 
--

CREATE TABLE dimpayhistory(
    PayHistorySK        INT               AUTO_INCREMENT,
    EmployeeSK          INT,
    Rate                DECIMAL(15, 2)    NOT NULL,
    PayFrequency        INT               NOT NULL,
    ModifiedDate        DATETIME          NOT NULL,
    scd_start           DATETIME,
    scd_end             DATETIME,
    scd_Version         INT,
    scd_Active          INT,
    SOR_ID              INT,
    DI_Job_ID           VARCHAR(20),
    DI_Create_Date      DATETIME,
    DI_Modified_Date    DATETIME,
    PRIMARY KEY (PayHistorySK)
)ENGINE=MYISAM
;



-- 
-- TABLE: dimproductcosthistory 
--

CREATE TABLE dimproductcosthistory(
    ProductCostHistorySK    INT               AUTO_INCREMENT,
    ProductSK               INT,
    StandardCost            DECIMAL(15, 2)    NOT NULL,
    ModifiedDate            DATETIME          NOT NULL,
    scd_start               DATETIME,
    scd_end                 DATETIME,
    scd_Version             INT,
    scd_Active              INT,
    SOR_ID                  INT,
    DI_Job_ID               VARCHAR(20),
    DI_Create_Date          DATETIME,
    DI_Modified_Date        DATETIME,
    PRIMARY KEY (ProductCostHistorySK)
)ENGINE=MYISAM
;



-- 
-- TABLE: dimproductpricehistory 
--

CREATE TABLE dimproductpricehistory(
    ProductPriceHistorySK    INT               AUTO_INCREMENT,
    SOR_ID                   INT               NOT NULL,
    ProductSK                INT,
    ListPrice                DECIMAL(15, 2)    NOT NULL,
    ModifiedDate             DATETIME          NOT NULL,
    scd_start                DATETIME,
    scd_end                  DATETIME,
    scd_Version              INT,
    scd_Active               INT,
    DI_Job_ID                VARCHAR(20),
    DI_Create_Date           DATETIME,
    DI_Modified_Date         DATETIME,         
    PRIMARY KEY (ProductPriceHistorySK, SOR_ID)
)ENGINE=MYISAM
;



-- 
-- TABLE: dimproducts_purchased 
--

CREATE TABLE dimproducts_purchased(
    ProductPurchasedSK        INT               AUTO_INCREMENT,
    ProductID                 INT               NOT NULL,
    ProductNumber             VARCHAR(25),
    ProductName               VARCHAR(50),
    ProductSubcategoryID      INT,
    ProductSubcategoryName    VARCHAR(50),
    ProductCategoryID         INT,
    ProductCategoryName       VARCHAR(50),
    ProductModelID            INT,
    FinishedGoodsFlag         INT,
    MakeFlag                  INT,
    StandardCost              DECIMAL(15, 2),
    ListPrice                 DECIMAL(15, 2),
    ProductLine               CHAR(2),
    ProductColor              VARCHAR(15),
    ProductSize               VARCHAR(50),
    ProductWeight             DECIMAL(15, 2),
    SellStartDate             DATE,
    SellEndDate               DATE,
    DiscontinuedDate          DATE,
    SOR_ID                    INT,
    SOR_LoadDate              DATETIME,
    SOR_UpdateDate            DATETIME,
    DI_Job_ID                 VARCHAR(20)       NOT NULL,
    DI_Create_Date            DATETIME          NOT NULL,
    DI_Modified_Date          DATETIME           NOT NULL,
    ProductSK                 INT,
    PRIMARY KEY (ProductPurchasedSK)
)ENGINE=MYISAM
;



-- 
-- TABLE: dimproductsall 
--

CREATE TABLE dimproductsall(
    ProductSK                 INT               AUTO_INCREMENT,
    ProductID                 INT               NOT NULL,
    ProductNumber             VARCHAR(25),
    ProductName               VARCHAR(50),
    ProductSubcategoryID      INT,
    ProductSubcategoryName    VARCHAR(50),
    ProductCategoryID         INT,
    ProductCategoryName       VARCHAR(50),
    ProductModelID            INT,
    ModelName                 VARCHAR(50),
    FinishedGoodsFlag         INT,
    MakeFlag                  INT,
    StandardCost              DECIMAL(15, 2),
    ListPrice                 DECIMAL(15, 2),
    ProductLine               CHAR(2),
    ProductColor              VARCHAR(15),
    ReorderPoint              INT,
    ProductSize               VARCHAR(50),
    ProductWeight             DECIMAL(15, 2),
    SellStartDate             DATE,
    SellEndDate               DATE,
    DiscontinuedDate          DATE,
    SOR_ID                    INT,
    SOR_LoadDate              DATETIME,
    SOR_UpdateDate            DATETIME,
    DI_Job_ID                 VARCHAR(20)       DEFAULT 'no_job_id' NOT NULL,
    DI_Create_Date            DATETIME           NOT NULL,
    DI_Modified_Date          DATETIME           NOT NULL,
    PRIMARY KEY (ProductSK)
)ENGINE=MYISAM
;



-- 
-- TABLE: dimproductvendor 
--

CREATE TABLE dimproductvendor(
    ProductVendorSK       INT               AUTO_INCREMENT,
    ProductPurchasedSK    INT,
    VendorSK              INT,
    ProductID             INT               NOT NULL,
    VendorID              INT               NOT NULL,
    AverageLeadTime       INT               NOT NULL,
    StandardPrice         DECIMAL(15, 2)    NOT NULL,
    LastReceiptCost       DECIMAL(15, 2),
    LastReceiptDateSK     INT,
    LastReceiptDate       DATETIME,
    OnOrderQty            INT,
    UnitMeasureCode       CHAR(3)           NOT NULL,
    SOR_ID                INT,
    SOR_LoadDate          DATETIME,
    SOR_UpdateDate        DATETIME,
    DI_Job_ID             VARCHAR(20)       NOT NULL,
    DI_Create_Date        DATETIME           NOT NULL,
    DI_Modified_Date      DATETIME           NOT NULL,
    ProductSK             INT,
    PRIMARY KEY (ProductVendorSK)
)ENGINE=MYISAM
;



-- 
-- TABLE: dimsalesterritory 
--

CREATE TABLE dimsalesterritory(
    SalesTerritorySK       INT            AUTO_INCREMENT,
    SalesTerritoryID       INT,
    SalesTerritoryName     VARCHAR(50)    NOT NULL,
    CountryRegionCode      VARCHAR(3)     NOT NULL,
    SalesTerritoryGroup    VARCHAR(50),
    SOR_ID                 INT,
    SOR_LoadDate           DATETIME,
    SOR_UpdateDate         DATETIME,
    DI_Job_ID              VARCHAR(20)    NOT NULL,
    DI_Create_Date         DATETIME        NOT NULL,
    DI_Modified_Date       DATETIME       NOT NULL,
    PRIMARY KEY (SalesTerritorySK)
)ENGINE=MYISAM
;



-- 
-- TABLE: dimscrapreason 
--

CREATE TABLE dimscrapreason(
    ScrapReasonSK       INT            AUTO_INCREMENT,
    ScrapReasonID       INT            NOT NULL,
    ScrapReasonName     VARCHAR(50)    NOT NULL,
    SOR_ID              INT,
    SOR_LoadDate        DATETIME,
    SOR_UpdateDate      DATETIME,
    DI_Job_ID           VARCHAR(20)    NOT NULL,
    DI_Create_Date      DATETIME        NOT NULL,
    DI_Modified_Date    DATETIME        NOT NULL,
    PRIMARY KEY (ScrapReasonSK)
)ENGINE=MYISAM
;



-- 
-- TABLE: dimshipmethod 
--

CREATE TABLE dimshipmethod(
    ShipMethodSK        INT               AUTO_INCREMENT,
    ShipMethodID        INT               NOT NULL,
    ShipMethodName      VARCHAR(50)       NOT NULL,
    ShipBase            DECIMAL(15, 2)    NOT NULL,
    ShipRate            DECIMAL(15, 2)    NOT NULL,
    SOR_ID              INT,
    SOR_LoadDate        DATETIME,
    SOR_UpdateDate      DATETIME,
    DI_Job_ID           VARCHAR(20)       NOT NULL,
    DI_Create_Date      DATETIME           NOT NULL,
    DI_Modified_Date    DATETIME           NOT NULL,
    PRIMARY KEY (ShipMethodSK)
)ENGINE=MYISAM
;



-- 
-- TABLE: dimvendorcontacts 
--

CREATE TABLE dimvendorcontacts(
    VendorContactsSK           INT            AUTO_INCREMENT,
    SOR_ID                     INT            NOT NULL,
    Person_BusinessEntityID    INT            NOT NULL,
    VendorSK                   INT,
    Vendor_BusinessEntityID    INT            NOT NULL,
    FirstName                  VARCHAR(50)    NOT NULL,
    MiddleName                 VARCHAR(50),
    LastName                   VARCHAR(50)    NOT NULL,
    PhoneNumber                VARCHAR(25),
    EmailAddress               VARCHAR(50),
    SOR_LoadDate               DATETIME,
    SOR_UpdateDate             DATETIME,
    DI_Job_ID                  VARCHAR(20)    NOT NULL,
    DI_Create_Date             DATETIME        NOT NULL,
    DI_Modified_Date           DATETIME        NOT NULL,
    PRIMARY KEY (VendorContactsSK, SOR_ID)
)ENGINE=MYISAM
;



-- 
-- TABLE: dimvendors 
--

CREATE TABLE dimvendors(
    VendorSK                 INT            AUTO_INCREMENT,
    BusinessEntityID         INT            NOT NULL,
    AccountNumber            VARCHAR(15)    NOT NULL,
    VendorName               VARCHAR(50)    NOT NULL,
    PreferredVendorStatus    VARCHAR(1)     NOT NULL,
    ActiveFlag               INT            NOT NULL,
    AddressTypeName          VARCHAR(50)    NOT NULL,
    AddressLine1             VARCHAR(60)    NOT NULL,
    AddressLine2             VARCHAR(60),
    GeoSK                    INT,
    SOR_ID                   INT,
    SOR_LoadDate             DATETIME,
    SOR_UpdateDate           DATETIME,
    DI_Job_ID                VARCHAR(20)    NOT NULL,
    DI_Create_Date           DATETIME        NOT NULL,
    DI_Modified_Date         DATETIME        NOT NULL,
    PRIMARY KEY (VendorSK)
)ENGINE=MYISAM
;



-- 
-- TABLE: fact_workorder 
--

CREATE TABLE fact_workorder(
    WorkOrderSK              INT            AUTO_INCREMENT,
    WorkOrderID              INT            NOT NULL,
    ProductSK                INT,
    OrderQty                 INT            NOT NULL,
    StockedQty               INT            DEFAULT 0 NOT NULL,
    ScrappedQty              INT            NOT NULL,
    WorkOrder_StartDateSK    INT            NOT NULL,
    WorkOrder_EndDateSK      INT,
    WorkOrder_DueDateSK      INT            NOT NULL,
    StartDate                DATETIME       NOT NULL,
    EndDate                  DATETIME,
    DueDate                  DATETIME       NOT NULL,
    ScrapReasonSK            INT,
    SOR_ID                   INT,
    SOR_LoadDate             DATETIME,
    SOR_UpdateDate           DATETIME,
    DI_Job_ID                VARCHAR(20)    NOT NULL,
    DI_Create_Date           DATETIME        NOT NULL,
    DI_Modified_Date         DATETIME       NOT NULL,
    PRIMARY KEY (WorkOrderSK)
)ENGINE=MYISAM
;



-- 
-- TABLE: fact_workorder_rejects 
--

CREATE TABLE fact_workorder_rejects(
    RejectWorkOrderRoutingSK    INT            AUTO_INCREMENT,
    WorkOrderID                 INT,
    ProductSK                   INT,
    OrderQty                    INT,
    StockedQty                  INT            DEFAULT 0,
    ScrappedQty                 INT,
    WorkOrder_StartDateSK       INT,
    WorkOrder_EndDateSK         INT,
    WorkOrder_DueDateSK         INT,
    StartDate                   DATETIME,
    EndDate                     DATETIME,
    DueDate                     DATETIME,
    ProductID                   INT,
    ScrapReasonSK               INT,
    DI_Reject_SK                INT,
    SOR_ID                      INT,
    SOR_LoadDate                DATETIME,
    SOR_UpdateDate              DATETIME,
    DI_Job_ID                   VARCHAR(20)    NOT NULL,
    DI_Create_Date              DATETIME        NOT NULL,
    DI_Modified_Date            DATETIME        NOT NULL,
    WorkOrderSK                 INT,
    LocationSK                  INT,
    PRIMARY KEY (RejectWorkOrderRoutingSK)
)ENGINE=MYISAM
;



-- 
-- TABLE: fact_workorderrouting 
--

CREATE TABLE fact_workorderrouting(
    WorkOrderRoutingSK      INT               AUTO_INCREMENT,
    WorkOrderSK             INT,
    ProductSK               INT,
    OperationSequence       INT               NOT NULL,
    LocationSK              INT,
    ScheduledStartDate      DATETIME          NOT NULL,
    ScheduledEndDate        DATETIME          NOT NULL,
    ActualStartDate         DATETIME,
    ActualEndDate           DATETIME,
    ScheduledStartDateSK    INT               NOT NULL,
    ScheduledEndDateSK      INT               NOT NULL,
    ActualStartDateSK       INT,
    ActualEndDateSK         INT,
    ActualResourceHrs       DECIMAL(9, 4),
    PlannedCost             DECIMAL(15, 2),
    ActualCost              DECIMAL(15, 2),
    SOR_ID                  INT,
    SOR_LoadDate            DATETIME,
    SOR_UpdateDate          DATETIME,
    DI_Job_ID               VARCHAR(20)       NOT NULL,
    DI_Create_Date          DATETIME           NOT NULL,
    DI_Modified_Date        DATETIME          NOT NULL,
    PRIMARY KEY (WorkOrderRoutingSK)
)ENGINE=MYISAM
;



-- 
-- TABLE: fact_workorderrouting_rejects 
--

CREATE TABLE fact_workorderrouting_rejects(
    RejectWorkOrderRoutingSK    INT               AUTO_INCREMENT,
    WorkOrderSK                 INT,
    ProductSK                   INT,
    OperationSequence           INT,
    LocationSK                  INT,
    ScheduledStartDate          DATETIME,
    ScheduledEndDate            DATETIME,
    ActualStartDate             DATETIME,
    ActualEndDate               DATETIME,
    ScheduledStartDateSK        INT,
    ScheduledEndDateSK          INT,
    ActualStartDateSK           INT,
    ActualEndDateSK             INT,
    ActualResourceHrs           DECIMAL(9, 4),
    PlannedCost                 DECIMAL(15, 2),
    ActualCost                  DECIMAL(15, 2),
    WorkOrderID                 INT,
    ProductID                   INT,
    LocationID                  INT,
    DI_Reject_SK                INT,
    SOR_ID                      INT               DEFAULT -1 NOT NULL,
    SOR_LoadDate                DATETIME,
    SOR_UpdateDate              DATETIME,
    DI_Job_ID                   VARCHAR(20)       NOT NULL,
    DI_Create_Date              DATETIME           NOT NULL,
    DI_Modified_Date            DATETIME           NOT NULL,
    PRIMARY KEY (RejectWorkOrderRoutingSK)
)ENGINE=MYISAM
;



-- 
-- TABLE: factpurchases 
--

CREATE TABLE factpurchases(
    SOR_ID                   INT               NOT NULL,
    PurchaseSK               INT,
    PurchaseOrderID          INT               NOT NULL,
    PurchaseOrderDetailID    INT               NOT NULL,
    Status                   INT               NOT NULL,
    EmployeeSK               INT,
    VendorSK                 INT,
    ShipMethodSK             INT,
    EmployeeID               INT               NOT NULL,
    VendorID                 INT               NOT NULL,
    ShipMethodID             INT               NOT NULL,
    OrderDateSK              INT               NOT NULL,
    ShipDateSK               INT,
    OrderDate                DATETIME          NOT NULL,
    ShipDate                 DATETIME,
    ProductPurchasedSK       INT               NOT NULL,
    SubTotal                 DECIMAL(15, 2)    NOT NULL,
    TaxAmt                   DECIMAL(15, 2)    NOT NULL,
    Freight                  DECIMAL(15, 2)    NOT NULL,
    TotalDue                 DECIMAL(15, 2)    NOT NULL,
    DueDate                  DATETIME          NOT NULL,
    OrderQty                 INT               NOT NULL,
    UnitPrice                DECIMAL(15, 2)    NOT NULL,
    LineTotal                DECIMAL(15, 2)    NOT NULL,
    ReceivedQty              INT               NOT NULL,
    RejectedQty              INT               NOT NULL,
    StockedQty               INT               NOT NULL,
    LineTaxAmount            DECIMAL(15, 2)    NOT NULL,
    LineFreight              DECIMAL(15, 2)    NOT NULL,
    LineTotalDue             DECIMAL(15, 2),
    SOR_LoadDate             DATETIME,
    SOR_UpdateDate           DATETIME,
    DI_Job_ID                VARCHAR(20)       NOT NULL,
    DI_Create_Date           DATETIME           NOT NULL,
    DI_Modified_Date         DATETIME           NOT NULL,
    PRIMARY KEY (SOR_ID)
)ENGINE=MYISAM
;



-- 
-- TABLE: factpurchases_rejects 
--

CREATE TABLE factpurchases_rejects(
    PurchaseSK               INT               AUTO_INCREMENT,
    PurchaseOrderID          INT,
    PurchaseOrderDetailID    INT,
    Status                   INT,
    EmployeeSK               INT,
    VendorSK                 INT,
    ShipMethodSK             INT,
    EmployeeID               INT,
    VendorID                 INT,
    ShipMethodID             INT,
    OrderDateSK              INT,
    ShipDateSK               INT,
    OrderDate                DATETIME,
    ShipDate                 DATETIME,
    ProductPurchasedSK       INT,
    SubTotal                 DECIMAL(15, 2),
    TaxAmt                   DECIMAL(15, 2),
    Freight                  DECIMAL(15, 2),
    TotalDue                 DECIMAL(15, 2),
    DueDate                  DATETIME,
    OrderQty                 INT,
    UnitPrice                DECIMAL(15, 2),
    LineTotal                DECIMAL(15, 2),
    ReceivedQty              INT,
    RejectedQty              INT,
    StockedQty               INT,
    LineTaxAmount            DECIMAL(15, 2),
    LineFreight              DECIMAL(15, 2),
    LineTotalDue             DECIMAL(15, 2),
    DI_Reject_SK             INT,
    SOR_ID                   INT,
    SOR_LoadDate             DATETIME,
    SOR_UpdateDate           DATETIME,
    DI_Job_ID                VARCHAR(20)       NOT NULL,
    DI_Create_Date           DATETIME           NOT NULL,
    DI_Modified_Date         DATETIME           NOT NULL,
    PRIMARY KEY (PurchaseSK)
)ENGINE=MYISAM
;



-- 
-- TABLE: dim_rejectcodes 
--

ALTER TABLE dim_rejectcodes ADD CONSTRAINT Refdim_sorsystem1 
    FOREIGN KEY (SOR_ID)
    REFERENCES dim_sorsystem(SOR_ID) ON DELETE RESTRICT ON UPDATE RESTRICT
;


-- 
-- TABLE: dimcustomerperson 
--

ALTER TABLE dimcustomerperson ADD CONSTRAINT Refdim_sorsystem2 
    FOREIGN KEY (SOR_ID)
    REFERENCES dim_sorsystem(SOR_ID) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE dimcustomerperson ADD CONSTRAINT Refdimgeography6 
    FOREIGN KEY (GeoSK)
    REFERENCES dimgeography(GeoSK) ON DELETE RESTRICT ON UPDATE RESTRICT
;


-- 
-- TABLE: dimdate 
--

ALTER TABLE dimdate ADD CONSTRAINT Refdim_sorsystem3 
    FOREIGN KEY (SOR_ID)
    REFERENCES dim_sorsystem(SOR_ID) ON DELETE RESTRICT ON UPDATE RESTRICT
;


-- 
-- TABLE: dimemployee 
--

ALTER TABLE dimemployee ADD CONSTRAINT Refdim_sorsystem4 
    FOREIGN KEY (SOR_ID)
    REFERENCES dim_sorsystem(SOR_ID) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE dimemployee ADD CONSTRAINT Refdimgeography5 
    FOREIGN KEY (GeoSK)
    REFERENCES dimgeography(GeoSK) ON DELETE RESTRICT ON UPDATE RESTRICT
;


-- 
-- TABLE: dimgeography 
--

ALTER TABLE dimgeography ADD CONSTRAINT Refdimsalesterritory22 
    FOREIGN KEY (SalesTerritorySK)
    REFERENCES dimsalesterritory(SalesTerritorySK) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE dimgeography ADD CONSTRAINT Refdim_sorsystem7 
    FOREIGN KEY (SOR_ID)
    REFERENCES dim_sorsystem(SOR_ID) ON DELETE RESTRICT ON UPDATE RESTRICT
;


-- 
-- TABLE: dimlocation 
--

ALTER TABLE dimlocation ADD CONSTRAINT Refdim_sorsystem8 
    FOREIGN KEY (SOR_ID)
    REFERENCES dim_sorsystem(SOR_ID) ON DELETE RESTRICT ON UPDATE RESTRICT
;


-- 
-- TABLE: dimpayhistory 
--

ALTER TABLE dimpayhistory ADD CONSTRAINT Refdimemployee9 
    FOREIGN KEY (EmployeeSK)
    REFERENCES dimemployee(EmployeeSK) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE dimpayhistory ADD CONSTRAINT Refdim_sorsystem10 
    FOREIGN KEY (SOR_ID)
    REFERENCES dim_sorsystem(SOR_ID) ON DELETE RESTRICT ON UPDATE RESTRICT
;


-- 
-- TABLE: dimproductcosthistory 
--

ALTER TABLE dimproductcosthistory ADD CONSTRAINT Refdim_sorsystem11 
    FOREIGN KEY (SOR_ID)
    REFERENCES dim_sorsystem(SOR_ID) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE dimproductcosthistory ADD CONSTRAINT Refdimproductsall14 
    FOREIGN KEY (ProductSK)
    REFERENCES dimproductsall(ProductSK) ON DELETE RESTRICT ON UPDATE RESTRICT
;


-- 
-- TABLE: dimproductpricehistory 
--

ALTER TABLE dimproductpricehistory ADD CONSTRAINT Refdim_sorsystem12 
    FOREIGN KEY (SOR_ID)
    REFERENCES dim_sorsystem(SOR_ID) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE dimproductpricehistory ADD CONSTRAINT Refdimproductsall15 
    FOREIGN KEY (ProductSK)
    REFERENCES dimproductsall(ProductSK) ON DELETE RESTRICT ON UPDATE RESTRICT
;


-- 
-- TABLE: dimproducts_purchased 
--

ALTER TABLE dimproducts_purchased ADD CONSTRAINT Refdim_sorsystem13 
    FOREIGN KEY (SOR_ID)
    REFERENCES dim_sorsystem(SOR_ID) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE dimproducts_purchased ADD CONSTRAINT Refdimproductsall16 
    FOREIGN KEY (ProductSK)
    REFERENCES dimproductsall(ProductSK) ON DELETE RESTRICT ON UPDATE RESTRICT
;


-- 
-- TABLE: dimproductsall 
--

ALTER TABLE dimproductsall ADD CONSTRAINT Refdim_sorsystem20 
    FOREIGN KEY (SOR_ID)
    REFERENCES dim_sorsystem(SOR_ID) ON DELETE RESTRICT ON UPDATE RESTRICT
;


-- 
-- TABLE: dimproductvendor 
--

ALTER TABLE dimproductvendor ADD CONSTRAINT Refdim_sorsystem21 
    FOREIGN KEY (SOR_ID)
    REFERENCES dim_sorsystem(SOR_ID) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE dimproductvendor ADD CONSTRAINT Refdimvendors32 
    FOREIGN KEY (VendorSK)
    REFERENCES dimvendors(VendorSK) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE dimproductvendor ADD CONSTRAINT Refdimproducts_purchased18 
    FOREIGN KEY (ProductPurchasedSK)
    REFERENCES dimproducts_purchased(ProductPurchasedSK) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE dimproductvendor ADD CONSTRAINT Refdimproductsall19 
    FOREIGN KEY (ProductSK)
    REFERENCES dimproductsall(ProductSK) ON DELETE RESTRICT ON UPDATE RESTRICT
;


-- 
-- TABLE: dimsalesterritory 
--

ALTER TABLE dimsalesterritory ADD CONSTRAINT Refdim_sorsystem23 
    FOREIGN KEY (SOR_ID)
    REFERENCES dim_sorsystem(SOR_ID) ON DELETE RESTRICT ON UPDATE RESTRICT
;


-- 
-- TABLE: dimscrapreason 
--

ALTER TABLE dimscrapreason ADD CONSTRAINT Refdim_sorsystem24 
    FOREIGN KEY (SOR_ID)
    REFERENCES dim_sorsystem(SOR_ID) ON DELETE RESTRICT ON UPDATE RESTRICT
;


-- 
-- TABLE: dimshipmethod 
--

ALTER TABLE dimshipmethod ADD CONSTRAINT Refdim_sorsystem25 
    FOREIGN KEY (SOR_ID)
    REFERENCES dim_sorsystem(SOR_ID) ON DELETE RESTRICT ON UPDATE RESTRICT
;


-- 
-- TABLE: dimvendorcontacts 
--

ALTER TABLE dimvendorcontacts ADD CONSTRAINT Refdim_sorsystem26 
    FOREIGN KEY (SOR_ID)
    REFERENCES dim_sorsystem(SOR_ID) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE dimvendorcontacts ADD CONSTRAINT Refdimvendors27 
    FOREIGN KEY (VendorSK)
    REFERENCES dimvendors(VendorSK) ON DELETE RESTRICT ON UPDATE RESTRICT
;


-- 
-- TABLE: dimvendors 
--

ALTER TABLE dimvendors ADD CONSTRAINT Refdimgeography28 
    FOREIGN KEY (GeoSK)
    REFERENCES dimgeography(GeoSK) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE dimvendors ADD CONSTRAINT Refdim_sorsystem29 
    FOREIGN KEY (SOR_ID)
    REFERENCES dim_sorsystem(SOR_ID) ON DELETE RESTRICT ON UPDATE RESTRICT
;


-- 
-- TABLE: fact_workorder 
--

ALTER TABLE fact_workorder ADD CONSTRAINT Refdimscrapreason30 
    FOREIGN KEY (ScrapReasonSK)
    REFERENCES dimscrapreason(ScrapReasonSK) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE fact_workorder ADD CONSTRAINT Refdim_sorsystem31 
    FOREIGN KEY (SOR_ID)
    REFERENCES dim_sorsystem(SOR_ID) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE fact_workorder ADD CONSTRAINT Refdimproductsall33 
    FOREIGN KEY (ProductSK)
    REFERENCES dimproductsall(ProductSK) ON DELETE RESTRICT ON UPDATE RESTRICT
;


-- 
-- TABLE: fact_workorder_rejects 
--

ALTER TABLE fact_workorder_rejects ADD CONSTRAINT Refdim_rejectcodes34 
    FOREIGN KEY (DI_Reject_SK)
    REFERENCES dim_rejectcodes(DI_Reject_SK) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE fact_workorder_rejects ADD CONSTRAINT Refdim_sorsystem35 
    FOREIGN KEY (SOR_ID)
    REFERENCES dim_sorsystem(SOR_ID) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE fact_workorder_rejects ADD CONSTRAINT Refdimproductsall36 
    FOREIGN KEY (ProductSK)
    REFERENCES dimproductsall(ProductSK) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE fact_workorder_rejects ADD CONSTRAINT Refdimscrapreason37 
    FOREIGN KEY (ScrapReasonSK)
    REFERENCES dimscrapreason(ScrapReasonSK) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE fact_workorder_rejects ADD CONSTRAINT Reffact_workorder38 
    FOREIGN KEY (WorkOrderSK)
    REFERENCES fact_workorder(WorkOrderSK) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE fact_workorder_rejects ADD CONSTRAINT Refdimlocation47 
    FOREIGN KEY (LocationSK)
    REFERENCES dimlocation(LocationSK) ON DELETE RESTRICT ON UPDATE RESTRICT
;


-- 
-- TABLE: fact_workorderrouting 
--

ALTER TABLE fact_workorderrouting ADD CONSTRAINT Refdimproductsall39 
    FOREIGN KEY (ProductSK)
    REFERENCES dimproductsall(ProductSK) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE fact_workorderrouting ADD CONSTRAINT Refdim_sorsystem40 
    FOREIGN KEY (SOR_ID)
    REFERENCES dim_sorsystem(SOR_ID) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE fact_workorderrouting ADD CONSTRAINT Refdimlocation41 
    FOREIGN KEY (LocationSK)
    REFERENCES dimlocation(LocationSK) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE fact_workorderrouting ADD CONSTRAINT Reffact_workorder42 
    FOREIGN KEY (WorkOrderSK)
    REFERENCES fact_workorder(WorkOrderSK) ON DELETE RESTRICT ON UPDATE RESTRICT
;


-- 
-- TABLE: fact_workorderrouting_rejects 
--

ALTER TABLE fact_workorderrouting_rejects ADD CONSTRAINT Refdim_rejectcodes43 
    FOREIGN KEY (DI_Reject_SK)
    REFERENCES dim_rejectcodes(DI_Reject_SK) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE fact_workorderrouting_rejects ADD CONSTRAINT Refdimproductsall44 
    FOREIGN KEY (ProductSK)
    REFERENCES dimproductsall(ProductSK) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE fact_workorderrouting_rejects ADD CONSTRAINT Refdimlocation45 
    FOREIGN KEY (LocationSK)
    REFERENCES dimlocation(LocationSK) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE fact_workorderrouting_rejects ADD CONSTRAINT Reffact_workorder46 
    FOREIGN KEY (WorkOrderSK)
    REFERENCES fact_workorder(WorkOrderSK) ON DELETE RESTRICT ON UPDATE RESTRICT
;


-- 
-- TABLE: factpurchases 
--

ALTER TABLE factpurchases ADD CONSTRAINT Refdimvendors48 
    FOREIGN KEY (VendorSK)
    REFERENCES dimvendors(VendorSK) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE factpurchases ADD CONSTRAINT Refdimemployee49 
    FOREIGN KEY (EmployeeSK)
    REFERENCES dimemployee(EmployeeSK) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE factpurchases ADD CONSTRAINT Refdimshipmethod50 
    FOREIGN KEY (ShipMethodSK)
    REFERENCES dimshipmethod(ShipMethodSK) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE factpurchases ADD CONSTRAINT Refdim_sorsystem51 
    FOREIGN KEY (SOR_ID)
    REFERENCES dim_sorsystem(SOR_ID) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE factpurchases ADD CONSTRAINT Reffactpurchases_rejects58 
    FOREIGN KEY (PurchaseSK)
    REFERENCES factpurchases_rejects(PurchaseSK) ON DELETE RESTRICT ON UPDATE RESTRICT
;


-- 
-- TABLE: factpurchases_rejects 
--

ALTER TABLE factpurchases_rejects ADD CONSTRAINT Refdim_sorsystem52 
    FOREIGN KEY (SOR_ID)
    REFERENCES dim_sorsystem(SOR_ID) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE factpurchases_rejects ADD CONSTRAINT Refdim_rejectcodes53 
    FOREIGN KEY (DI_Reject_SK)
    REFERENCES dim_rejectcodes(DI_Reject_SK) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE factpurchases_rejects ADD CONSTRAINT Refdim_rejectcodes54 
    FOREIGN KEY (DI_Reject_SK)
    REFERENCES dim_rejectcodes(DI_Reject_SK) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE factpurchases_rejects ADD CONSTRAINT Refdimemployee55 
    FOREIGN KEY (EmployeeSK)
    REFERENCES dimemployee(EmployeeSK) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE factpurchases_rejects ADD CONSTRAINT Refdimshipmethod56 
    FOREIGN KEY (ShipMethodSK)
    REFERENCES dimshipmethod(ShipMethodSK) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE factpurchases_rejects ADD CONSTRAINT Refdimproducts_purchased57 
    FOREIGN KEY (ProductPurchasedSK)
    REFERENCES dimproducts_purchased(ProductPurchasedSK) ON DELETE RESTRICT ON UPDATE RESTRICT
;

