--
-- ER/Studio Data Architect SQL Code Generation
-- Project :      DATA MODEL
--
-- Date Created : Wednesday, February 26, 2020 03:36:17
-- Target DBMS : Oracle 11g
--

-- 
-- TABLE: Dim_Date 
--

CREATE TABLE Dim_Date(
    DateKey                 NUMBER(38, 0)    NOT NULL,
    FullDateAlternateKey    DATE,
    DayNumberofMonth        NUMBER(3, 0)     NOT NULL,
    MonthName               VARCHAR2(10)     NOT NULL,
    MonthNumberOfYear       NUMBER(3, 0)     NOT NULL,
    CalenderYear            SMALLINT         NOT NULL,
    FiscalQuarter           NUMBER(3, 0)     NOT NULL,
    CalenderQuarter         NUMBER(3, 0)     NOT NULL,
    FiscalYear              SMALLINT         NOT NULL,
    CONSTRAINT PRIMARY PRIMARY KEY (DateKey)
)
;



-- 
-- TABLE: Dim_geography 
--

CREATE TABLE Dim_geography(
    Geography_Durable_Sk         NUMBER(38, 0)    NOT NULL,
    City                         VARCHAR2(30),
    StateProvinceCode            NVARCHAR2(10)    NOT NULL,
    IsOnlyStateProvinceFlag      NUMBER(38, 0),
    StateProvinceName            VARCHAR2(50),
    CountryRegionName            VARCHAR2(50),
    CountryRegionCode            VARCHAR2(10),
    PostalCode                   VARCHAR2(15),
    DI_JobID                     VARCHAR2(50),
    DI_CreatedDate               TIMESTAMP(6),
    DI_ModifiedDate              TIMESTAMP(6),
    SalesTerritory_Durable_SK    NUMBER(38, 0),
    CONSTRAINT PRIMARY_6 PRIMARY KEY (Geography_Durable_Sk)
)
;



-- 
-- TABLE: Dim_location 
--

CREATE TABLE Dim_location(
    Location_Durable_SK       NUMBER(38, 0)    NOT NULL,
    DimProductInventoryKey    NUMBER(38, 0),
    Product_Durable_SK        NUMBER(38, 0),
    DI_Modified_Date          TIMESTAMP(6),
    DI_Created_Date           TIMESTAMP(6),
    DI_Job_id                 VARCHAR2(10),
    LocationID                NUMBER(38, 0)    NOT NULL,
    LocationName              VARCHAR2(50)     NOT NULL,
    CostRate                  NUMBER(15, 2)    NOT NULL,
    Availability              NUMBER(8, 2)     NOT NULL,
    ModifiedDate              TIMESTAMP(6)     NOT NULL,
    CONSTRAINT PRIMARY_6_1 PRIMARY KEY (Location_Durable_SK)
)
;



-- 
-- TABLE: Dim_payhistory 
--

CREATE TABLE Dim_payhistory(
    PayHistory_Durable_SK    NUMBER(38, 0)    NOT NULL,
    Employee_durable_sk      NUMBER(38, 0)    NOT NULL,
    DI_MODIFIED_DATE         TIMESTAMP(6),
    DI_JOB_ID                VARCHAR2(10),
    DI_CREATED_ID            TIMESTAMP(6),
    Rate                     NUMBER(15, 2)    NOT NULL,
    PayFrequency             NUMBER(38, 0)    NOT NULL,
    ModifiedDate             TIMESTAMP(6)     NOT NULL,
    scd_start                TIMESTAMP(6),
    scd_end                  TIMESTAMP(6),
    scd_Version              NUMBER(38, 0),
    scd_Active               NUMBER(38, 0),
    CONSTRAINT PRIMARY_7 PRIMARY KEY (PayHistory_Durable_SK, Employee_durable_sk)
)
;



-- 
-- TABLE: Dim_product 
--

CREATE TABLE Dim_product(
    Product_Durable_SK        NUMBER(38, 0)    NOT NULL,
    ProductID                 NUMBER(38, 0)    NOT NULL,
    ProductName               VARCHAR2(50)     NOT NULL,
    ProductModelName          VARCHAR2(50),
    ProductCategoryName       VARCHAR2(50),
    ProductSubCategoryName    VARCHAR2(50),
    ProductNumber             VARCHAR2(25)     NOT NULL,
    MakeFlag                  NUMBER(3, 0)     NOT NULL,
    FinishedGoodsFlag         NUMBER(3, 0)     NOT NULL,
    Color                     VARCHAR2(15),
    SafetyStockLevel          SMALLINT         NOT NULL,
    ReorderPoint              SMALLINT         NOT NULL,
    StandardCost              NUMBER(18, 4)    NOT NULL,
    ListPrice                 NUMBER(18, 4)    NOT NULL,
    ProductSize                      VARCHAR2(5),
    Weight                    NUMBER(8, 2),
    DaysToManufacture         NUMBER(38, 0)    NOT NULL,
    ProductLine               VARCHAR2(2),
    ProductClass                     VARCHAR2(2),
    ProductStyle                     VARCHAR2(2),
    SellStartDate             TIMESTAMP(6)     NOT NULL,
    SellEndDate               TIMESTAMP(6),
    DiscontinuedDate          TIMESTAMP(6),
    ModifiedDate              TIMESTAMP(6)     NOT NULL,
    DI_JobID                  VARCHAR2(50),
    DI_CreatedDate            TIMESTAMP(6),
    DI_ModifiedDate           TIMESTAMP(6),
    CONSTRAINT PRIMARY_4 PRIMARY KEY (Product_Durable_SK)
)
;



-- 
-- TABLE: Dim_product_costhistory 
--

CREATE TABLE Dim_product_costhistory(
    ProductCostPrice_durable_sk    NUMBER(19, 0)    NOT NULL,
    Product_Durable_SK             NUMBER(38, 0)    NOT NULL,
    ProductKey                     NUMBER(38, 0)    NOT NULL,
    StandardCost                   NUMBER(18, 4)    NOT NULL,
    EffectiveStartDate             TIMESTAMP(6)     NOT NULL,
    EffectiveEndDate               TIMESTAMP(6),
    CurrentIndicator               NUMBER(38, 0)    NOT NULL,
    ModifiedDate                   TIMESTAMP(6)     NOT NULL,
    DI_JobID                       VARCHAR2(50),
    DI_CREATEDDATE                 TIMESTAMP(6),
    DI_ModifiedDate                TIMESTAMP(6),
    CONSTRAINT PRIMARY_3 PRIMARY KEY (ProductCostPrice_durable_sk, Product_Durable_SK)
)
;



-- 
-- TABLE: Dim_productinventory 
--

CREATE TABLE Dim_productinventory(
    DimProductInventoryKey    NUMBER(38, 0)    NOT NULL,
    Product_Durable_SK        NUMBER(38, 0)    NOT NULL,
    ProductID                 NUMBER(38, 0)    NOT NULL,
    Shelf                     VARCHAR2(10)     NOT NULL,
    Bin                       NUMBER(3, 0)     NOT NULL,
    Quantity                  SMALLINT         NOT NULL,
    ModifiedDate              TIMESTAMP(6)     NOT NULL,
    DI_JobID                  VARCHAR2(50),
    DI_CreatedDate            TIMESTAMP(6),
    DI_ModifiedDate           TIMESTAMP(6),
    CONSTRAINT PRIMARY_11 PRIMARY KEY (DimProductInventoryKey, Product_Durable_SK)
)
;



-- 
-- TABLE: Dim_productvendor 
--

CREATE TABLE Dim_productvendor(
    VendorKey             NUMBER(38, 0)    NOT NULL,
    Product_Durable_SK    NUMBER(38, 0)    NOT NULL,
    AverageLeadTime       NUMBER(38, 0)    NOT NULL,
    StandardPrice         NUMBER(18, 4)    NOT NULL,
    LastReceiptCost       NUMBER(18, 4),
    LastReceiptDate       TIMESTAMP(6),
    MinOrderQty           NUMBER(38, 0)    NOT NULL,
    MaxOrderQty           NUMBER(38, 0)    NOT NULL,
    OnOrderQty            NUMBER(38, 0),
    ModifiedDate          TIMESTAMP(6)     NOT NULL,
    DI_JobID              VARCHAR2(50),
    DI_CreatedDate        TIMESTAMP(6),
    DI_ModifiedDate       TIMESTAMP(6),
    CONSTRAINT PRIMARY_12 PRIMARY KEY (VendorKey, Product_Durable_SK)
)
;



-- 
-- TABLE: dim_rejectcodes 
--

CREATE TABLE dim_rejectcodes(
    DI_Reject_SK            NUMBER(38, 0)    NOT NULL,
    DI_RejectCode           NUMBER(38, 0)    NOT NULL,
    DI_RejectReason         CHAR(80),
    DI_RejectDescription    CHAR(255),
    CONSTRAINT PRIMARY_2 PRIMARY KEY (DI_Reject_SK)
)
;



-- 
-- TABLE: Dim_salesterritory 
--

CREATE TABLE Dim_salesterritory(
    SalesTerritory_Durable_SK    NUMBER(38, 0)    NOT NULL,
    TerritoryID                  NUMBER(38, 0)    NOT NULL,
    SalesTerritoryName           VARCHAR2(50)     NOT NULL,
    CountryRegionCode            VARCHAR2(3)      NOT NULL,
    SalesGroup                   VARCHAR2(50)     NOT NULL,
    SalesTerritoryGroup          NVARCHAR2(10),
    SalesYTD                     NUMBER(18, 4)    NOT NULL,
    CostYTD                      NUMBER(18, 4)    NOT NULL,
    CostLastYear                 NUMBER(18, 4)    NOT NULL,
    ModifiedDate                 TIMESTAMP(6)     NOT NULL,
    DI_JobID                     VARCHAR2(50),
    DI_CreatedDate               TIMESTAMP(6),
    DI_ModifiedDate              TIMESTAMP(6),
    CONSTRAINT PRIMARY_8 PRIMARY KEY (SalesTerritory_Durable_SK)
)
;



-- 
-- TABLE: Dim_shipmethod 
--

CREATE TABLE Dim_shipmethod(
    ShipMethod_durable_sk    NUMBER(38, 0)    NOT NULL,
    ShipMethodID             NUMBER(38, 0)    NOT NULL,
    ShipMethodName           VARCHAR2(50)     NOT NULL,
    ShipBase                 NUMBER(15, 2)    NOT NULL,
    ShipRate                 NUMBER(15, 2)    NOT NULL,
    DI_JOB_ID                VARCHAR2(10),
    DI_CREATED_DATE          TIMESTAMP(6),
    DI_MODIFIED_DATE         TIMESTAMP(6),
    CONSTRAINT PRIMARY_15 PRIMARY KEY (ShipMethod_durable_sk)
)
;



-- 
-- TABLE: Dim_sorsystem 
--

CREATE TABLE Dim_sorsystem(
    SOR_ID             NUMBER(38, 0)    NOT NULL,
    SOR_Name           CHAR(20),
    SOR_Description    CHAR(80),
    SOR_Type           VARCHAR2(80),
    SOR_DBMS           VARCHAR2(80),
    SOR_DBName         VARCHAR2(80),
    SOR_DBSchema       VARCHAR2(80),
    SOR_FileType       VARCHAR2(80),
    SOR_Filename       VARCHAR2(255),
    SOR_AppName        VARCHAR2(255),
    SOR_AppModule      VARCHAR2(255),
    CONSTRAINT PRIMARY_1 PRIMARY KEY (SOR_ID)
)
;



-- 
-- TABLE: Dim_vendor 
--

CREATE TABLE Dim_vendor(
    VendorKey                NUMBER(38, 0)    NOT NULL,
    GeographyKey             NUMBER(38, 0)    NOT NULL,
    VendorID                 NUMBER(38, 0)    NOT NULL,
    Name                     VARCHAR2(50)     NOT NULL,
    PreferredVendorStatus    NUMBER(3, 0)     NOT NULL,
    CreditRate               NUMBER(3, 0)     NOT NULL,
    ActiveFlag               NUMBER(1, 0)     NOT NULL,
    AddressLine1             VARCHAR2(60),
    AddressLine2             VARCHAR2(60),
    ModifiedDate             TIMESTAMP(6)     NOT NULL,
    DI_JobID                 VARCHAR2(50),
    DI_CreatedDate           TIMESTAMP(6),
    DI_ModifiedDate          TIMESTAMP(6),
    CONSTRAINT PRIMARY_5 PRIMARY KEY (VendorKey)
)
;



-- 
-- TABLE: Dim_vendorcontacts 
--

CREATE TABLE Dim_vendorcontacts(
    VendorContacts_Durable_SK    NUMBER(38, 0)    NOT NULL,
    VendorKey                    NUMBER(38, 0)    NOT NULL,
    BusinessEntity_ID            NUMBER(38, 0),
    FirstName                    VARCHAR2(50)     NOT NULL,
    MiddleName                   VARCHAR2(50),
    LastName                     VARCHAR2(50)     NOT NULL,
    Suffix                       VARCHAR2(10),
    phoneNumber                  VARCHAR2(25),
    EmailAddress                 VARCHAR2(50),
    DI_JobID                     VARCHAR2(50),
    DI_CreatedDate               TIMESTAMP(6),
    DI_ModifiedDate              TIMESTAMP(6),
    CONSTRAINT PRIMARY_10 PRIMARY KEY (VendorContacts_Durable_SK, VendorKey)
)
;



-- 
-- TABLE: dimemployee 
--

CREATE TABLE dimemployee(
    Employee_durable_sk     NUMBER(38, 0)    NOT NULL,
    Geography_Durable_Sk    NUMBER(38, 0),
    BusinessEntityID        NUMBER(38, 0)    NOT NULL,
    EmployeeNationalID      VARCHAR2(15),
    AddressLine1            VARCHAR2(60),
    AddressLine2            VARCHAR2(60),
    AddressType             VARCHAR2(50),
    FirstName               VARCHAR2(50)     NOT NULL,
    LastName                VARCHAR2(50)     NOT NULL,
    MiddleName              VARCHAR2(50),
    HireDate                DATE,
    BirthDate               DATE,
    EmailAddress            VARCHAR2(50),
    Phone                   VARCHAR2(25),
    SalariedFlag            NUMBER(38, 0),
    Gender                  CHAR(1),
    PayFrequency            NUMBER(38, 0),
    BaseRate                NUMBER(15, 2),
    CurrentFlag             NUMBER(38, 0)    NOT NULL,
    SalesPersonFlag         NUMBER(38, 0)    NOT NULL,
    DepartmentName          VARCHAR2(50),
    StartDate               DATE,
    EndDate                 DATE,
    Status                  VARCHAR2(50),
    DI_JOB_ID               VARCHAR2(10),
    DI_MODIFIED_DATE        TIMESTAMP(6),
    DI_CREATED_DATE         VARCHAR2(10),
    CONSTRAINT PRIMARY_3_2 PRIMARY KEY (Employee_durable_sk)
)
;



-- 
-- TABLE: DimListpricehistory 
--

CREATE TABLE DimListpricehistory(
    ProductListpricehis_durable_sk    NUMBER(38, 0)    NOT NULL,
    Product_Durable_SK                    NUMBER(38, 0)    NOT NULL,
    DI_JOB_ID                             VARCHAR2(10),
    DI_MODIFIED_DATE                      TIMESTAMP(6),
    DI_CREATED_DATE                       TIMESTAMP(6),
    ListPrice                             NUMBER(15, 2)    NOT NULL,
    ModifiedDate                          TIMESTAMP(6)     NOT NULL,
    scd_start                             TIMESTAMP(6),
    scd_end                               TIMESTAMP(6),
    scd_Version                           NUMBER(38, 0),
    scd_Active                            NUMBER(38, 0),
    CONSTRAINT PRIMARY_9 PRIMARY KEY (ProductListpricehis_durable_sk, Product_Durable_SK)
)
;



-- 
-- TABLE: dimscrapreason 
--

CREATE TABLE dimscrapreason(
    ScrapReasonSK       NUMBER(38, 0)    NOT NULL,
    ScrapReasonID       NUMBER(38, 0)    NOT NULL,
    ScrapReasonName     VARCHAR2(50)     NOT NULL,
    DI_JOB_ID           VARCHAR2(10),
    DI_MODIFIED_DATE    TIMESTAMP(6),
    DI_CREATED_DATE     TIMESTAMP(6),
    CONSTRAINT PRIMARY_13 PRIMARY KEY (ScrapReasonSK)
)
;



-- 
-- TABLE: Fact_purchases 
--

CREATE TABLE Fact_purchases(
    Purchase_Durable_SK           NUMBER(38, 0)    NOT NULL,
    DateKey                       NUMBER(38, 0)    NOT NULL,
    Product_Durable_SK            NUMBER(38, 0)    NOT NULL,
    ShipMethod_durable_sk         NUMBER(38, 0)    NOT NULL,
    Employee_durable_sk           NUMBER(38, 0)    NOT NULL,
    VendorKey                     NUMBER(38, 0)    NOT NULL,
    Purchase_reject_Durable_Sk    NUMBER(38, 0)    NOT NULL,
    PurchaseOrderID               NUMBER(38, 0)    NOT NULL,
    PurchaseOrderDetailID         NUMBER(38, 0)    NOT NULL,
    Status                        NUMBER(38, 0)    NOT NULL,
    EmployeeID                    NUMBER(38, 0)    NOT NULL,
    VendorID                      NUMBER(38, 0)    NOT NULL,
    ShipMethodID                  NUMBER(38, 0)    NOT NULL,
    OrderDate                     TIMESTAMP(6)     NOT NULL,
    ShipDate                      TIMESTAMP(6),
    SubTotal                      NUMBER(15, 2)    NOT NULL,
    TaxAmt                        NUMBER(15, 2)    NOT NULL,
    Freight                       NUMBER(15, 2)    NOT NULL,
    TotalDue                      NUMBER(15, 2)    NOT NULL,
    DueDate                       TIMESTAMP(6)     NOT NULL,
    OrderQty                      NUMBER(38, 0)    NOT NULL,
    UnitPrice                     NUMBER(15, 2)    NOT NULL,
    LineTotal                     NUMBER(15, 2)    NOT NULL,
    ReceivedQty                   NUMBER(38, 0)    NOT NULL,
    RejectedQty                   NUMBER(38, 0)    NOT NULL,
    StockedQty                    NUMBER(38, 0)    NOT NULL,
    LineTaxAmount                 NUMBER(15, 2)    NOT NULL,
    LineFreight                   NUMBER(15, 2)    NOT NULL,
    LineTotalDue                  NUMBER(15, 2),
    DI_JOB_ID                     VARCHAR2(10),
    DI_MODIFIED_DATE              TIMESTAMP(6),
    DI_CREATED_DATE               TIMESTAMP(6),
    CONSTRAINT PK29 PRIMARY KEY (Purchase_Durable_SK, DateKey, Product_Durable_SK, ShipMethod_durable_sk, Employee_durable_sk, VendorKey, Purchase_reject_Durable_Sk)
)
;



-- 
-- TABLE: fact_workorder 
--

CREATE TABLE fact_workorder(
    WorkOrder_Durable_SK     NUMBER(38, 0)    NOT NULL,
    ScrapReasonSK            NUMBER(38, 0)    NOT NULL,
    Product_Durable_SK       NUMBER(38, 0)    NOT NULL,
    WorkOrderRoutingSK       NUMBER(38, 0)    NOT NULL,
    WorkOrderID              NUMBER(38, 0)    NOT NULL,
    OrderQty                 NUMBER(38, 0)    NOT NULL,
    StockedQty               NUMBER(38, 0)    DEFAULT 0 NOT NULL,
    ScrappedQty              NUMBER(38, 0)    NOT NULL,
    WorkOrder_StartDateSK    NUMBER(38, 0)    NOT NULL,
    WorkOrder_EndDateSK      NUMBER(38, 0),
    WorkOrder_DueDateSK      NUMBER(38, 0)    NOT NULL,
    StartDate                TIMESTAMP(6)     NOT NULL,
    EndDate                  TIMESTAMP(6),
    DueDate                  TIMESTAMP(6)     NOT NULL,
    DI_JOB_ID                VARCHAR2(10),
    DI_MODIFIED_DATE         TIMESTAMP(6),
    DI_CREATED_DATE          TIMESTAMP(6),
    CONSTRAINT PRIMARY_17 PRIMARY KEY (WorkOrder_Durable_SK, ScrapReasonSK, Product_Durable_SK, WorkOrderRoutingSK)
)
;



-- 
-- TABLE: fact_workorder_rejects 
--

CREATE TABLE fact_workorder_rejects(
    RejectWorkOrRouting_Durable_SK    NUMBER(38, 0)    NOT NULL,
    WorkOrderID                          NUMBER(38, 0),
    OrderQty                             NUMBER(38, 0),
    StockedQty                           NUMBER(38, 0)    DEFAULT 0,
    ScrappedQty                          NUMBER(38, 0),
    WorkOrder_StartDateSK                NUMBER(38, 0),
    WorkOrder_EndDateSK                  NUMBER(38, 0),
    WorkOrder_DueDateSK                  NUMBER(38, 0),
    StartDate                            TIMESTAMP(6),
    EndDate                              TIMESTAMP(6),
    DueDate                              TIMESTAMP(6),
    ProductID                            NUMBER(38, 0),
    DI_JOB_ID                            VARCHAR2(10),
    DI_CREATED_DATE                      TIMESTAMP(6),
    DI_MODIFIED_DATE                     TIMESTAMP(6),
    WorkOrder_Durable_SK                 NUMBER(38, 0),
    ScrapReasonSK                        NUMBER(38, 0),
    Product_Durable_SK                   NUMBER(38, 0),
    WorkOrderRoutingSK                   NUMBER(38, 0),
    CONSTRAINT PRIMARY_20 PRIMARY KEY (RejectWorkOrRouting_Durable_SK)
)
;



-- 
-- TABLE: fact_workorderrouting 
--

CREATE TABLE fact_workorderrouting(
    WorkOrderRoutingSK      NUMBER(38, 0)    NOT NULL,
    OperationSequence       NUMBER(38, 0)    NOT NULL,
    ScheduledStartDate      TIMESTAMP(6)     NOT NULL,
    ScheduledEndDate        TIMESTAMP(6)     NOT NULL,
    ActualStartDate         TIMESTAMP(6),
    ActualEndDate           TIMESTAMP(6),
    ScheduledStartDateSK    NUMBER(38, 0)    NOT NULL,
    ScheduledEndDateSK      NUMBER(38, 0)    NOT NULL,
    ActualStartDateSK       NUMBER(38, 0),
    ActualEndDateSK         NUMBER(38, 0),
    ActualResourceHrs       NUMBER(9, 4),
    PlannedCost             NUMBER(15, 2),
    ActualCost              NUMBER(15, 2),
    DI_JOB_ID               VARCHAR2(10),
    DI_CREATED_DATE         TIMESTAMP(6),
    DI_MODIFIED_DATE        TIMESTAMP(6),
    Location_Durable_SK     NUMBER(38, 0),
    CONSTRAINT PRIMARY_19 PRIMARY KEY (WorkOrderRoutingSK)
)
;



-- 
-- TABLE: factpurchases_rejects 
--

CREATE TABLE factpurchases_rejects(
    Purchase_reject_Durable_Sk    NUMBER(38, 0)    NOT NULL,
    Employee_durable_sk           NUMBER(38, 0)    NOT NULL,
    ShipMethod_durable_sk         NUMBER(38, 0)    NOT NULL,
    PurchaseOrderID               NUMBER(38, 0),
    PurchaseOrderDetailID         NUMBER(38, 0),
    Status                        NUMBER(38, 0),
    EmployeeID                    NUMBER(38, 0),
    VendorID                      NUMBER(38, 0),
    ShipMethodID                  NUMBER(38, 0),
    OrderDate                     TIMESTAMP(6),
    ShipDate                      TIMESTAMP(6),
    SubTotal                      NUMBER(15, 2),
    TaxAmt                        NUMBER(15, 2),
    Freight                       NUMBER(15, 2),
    TotalDue                      NUMBER(15, 2),
    DueDate                       TIMESTAMP(6),
    OrderQty                      NUMBER(38, 0),
    UnitPrice                     NUMBER(15, 2),
    LineTotal                     NUMBER(15, 2),
    ReceivedQty                   NUMBER(38, 0),
    RejectedQty                   NUMBER(38, 0),
    StockedQty                    NUMBER(38, 0),
    LineTaxAmount                 NUMBER(15, 2),
    LineFreight                   NUMBER(15, 2),
    LineTotalDue                  NUMBER(15, 2),
    DI_JOB_ID                     VARCHAR2(10),
    DI_CREATED_DATE               TIMESTAMP(6),
    DI_MODIFIED_DATE              TIMESTAMP(6),
    CONSTRAINT PRIMARY_25 PRIMARY KEY (Purchase_reject_Durable_Sk, Employee_durable_sk, ShipMethod_durable_sk)
)
;



-- 
-- TABLE: Dim_geography 
--

ALTER TABLE Dim_geography ADD CONSTRAINT RefDim_salesterritory16 
    FOREIGN KEY (SalesTerritory_Durable_SK)
    REFERENCES Dim_salesterritory(SalesTerritory_Durable_SK)
;


-- 
-- TABLE: Dim_location 
--

ALTER TABLE Dim_location ADD CONSTRAINT RefDim_productinventory23 
    FOREIGN KEY (DimProductInventoryKey, Product_Durable_SK)
    REFERENCES Dim_productinventory(DimProductInventoryKey, Product_Durable_SK)
;


-- 
-- TABLE: Dim_payhistory 
--

ALTER TABLE Dim_payhistory ADD CONSTRAINT Refdimemployee1 
    FOREIGN KEY (Employee_durable_sk)
    REFERENCES dimemployee(Employee_durable_sk)
;


-- 
-- TABLE: Dim_product_costhistory 
--

ALTER TABLE Dim_product_costhistory ADD CONSTRAINT RefDim_product2 
    FOREIGN KEY (Product_Durable_SK)
    REFERENCES Dim_product(Product_Durable_SK)
;


-- 
-- TABLE: Dim_productinventory 
--

ALTER TABLE Dim_productinventory ADD CONSTRAINT RefDim_product14 
    FOREIGN KEY (Product_Durable_SK)
    REFERENCES Dim_product(Product_Durable_SK)
;


-- 
-- TABLE: Dim_productvendor 
--

ALTER TABLE Dim_productvendor ADD CONSTRAINT RefDim_vendor10 
    FOREIGN KEY (VendorKey)
    REFERENCES Dim_vendor(VendorKey)
;

ALTER TABLE Dim_productvendor ADD CONSTRAINT RefDim_product12 
    FOREIGN KEY (Product_Durable_SK)
    REFERENCES Dim_product(Product_Durable_SK)
;


-- 
-- TABLE: Dim_vendorcontacts 
--

ALTER TABLE Dim_vendorcontacts ADD CONSTRAINT RefDim_vendor9 
    FOREIGN KEY (VendorKey)
    REFERENCES Dim_vendor(VendorKey)
;


-- 
-- TABLE: dimemployee 
--

ALTER TABLE dimemployee ADD CONSTRAINT RefDim_geography15 
    FOREIGN KEY (Geography_Durable_Sk)
    REFERENCES Dim_geography(Geography_Durable_Sk)
;


-- 
-- TABLE: DimListpricehistory 
--

ALTER TABLE DimListpricehistory ADD CONSTRAINT RefDim_product3 
    FOREIGN KEY (Product_Durable_SK)
    REFERENCES Dim_product(Product_Durable_SK)
;


-- 
-- TABLE: Fact_purchases 
--

ALTER TABLE Fact_purchases ADD CONSTRAINT RefDim_Date17 
    FOREIGN KEY (DateKey)
    REFERENCES Dim_Date(DateKey)
;

ALTER TABLE Fact_purchases ADD CONSTRAINT RefDim_product18 
    FOREIGN KEY (Product_Durable_SK)
    REFERENCES Dim_product(Product_Durable_SK)
;

ALTER TABLE Fact_purchases ADD CONSTRAINT RefDim_shipmethod19 
    FOREIGN KEY (ShipMethod_durable_sk)
    REFERENCES Dim_shipmethod(ShipMethod_durable_sk)
;

ALTER TABLE Fact_purchases ADD CONSTRAINT Refdimemployee20 
    FOREIGN KEY (Employee_durable_sk)
    REFERENCES dimemployee(Employee_durable_sk)
;

ALTER TABLE Fact_purchases ADD CONSTRAINT RefDim_vendor21 
    FOREIGN KEY (VendorKey)
    REFERENCES Dim_vendor(VendorKey)
;

ALTER TABLE Fact_purchases ADD CONSTRAINT Reffactpurchases_rejects33 
    FOREIGN KEY (Purchase_reject_Durable_Sk, Employee_durable_sk, ShipMethod_durable_sk)
    REFERENCES factpurchases_rejects(Purchase_reject_Durable_Sk, Employee_durable_sk, ShipMethod_durable_sk)
;


-- 
-- TABLE: fact_workorder 
--

ALTER TABLE fact_workorder ADD CONSTRAINT Refdimscrapreason6 
    FOREIGN KEY (ScrapReasonSK)
    REFERENCES dimscrapreason(ScrapReasonSK)
;

ALTER TABLE fact_workorder ADD CONSTRAINT RefDim_product24 
    FOREIGN KEY (Product_Durable_SK)
    REFERENCES Dim_product(Product_Durable_SK)
;

ALTER TABLE fact_workorder ADD CONSTRAINT Reffact_workorderrouting29 
    FOREIGN KEY (WorkOrderRoutingSK)
    REFERENCES fact_workorderrouting(WorkOrderRoutingSK)
;


-- 
-- TABLE: fact_workorder_rejects 
--

ALTER TABLE fact_workorder_rejects ADD CONSTRAINT Reffact_workorder30 
    FOREIGN KEY (WorkOrder_Durable_SK, ScrapReasonSK, Product_Durable_SK, WorkOrderRoutingSK)
    REFERENCES fact_workorder(WorkOrder_Durable_SK, ScrapReasonSK, Product_Durable_SK, WorkOrderRoutingSK)
;


-- 
-- TABLE: fact_workorderrouting 
--

ALTER TABLE fact_workorderrouting ADD CONSTRAINT RefDim_location28 
    FOREIGN KEY (Location_Durable_SK)
    REFERENCES Dim_location(Location_Durable_SK)
;


-- 
-- TABLE: factpurchases_rejects 
--

ALTER TABLE factpurchases_rejects ADD CONSTRAINT Refdimemployee34 
    FOREIGN KEY (Employee_durable_sk)
    REFERENCES dimemployee(Employee_durable_sk)
;

ALTER TABLE factpurchases_rejects ADD CONSTRAINT RefDim_shipmethod35 
    FOREIGN KEY (ShipMethod_durable_sk)
    REFERENCES Dim_shipmethod(ShipMethod_durable_sk)
;


