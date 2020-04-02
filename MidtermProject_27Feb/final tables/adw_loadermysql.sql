--
-- ER/Studio Data Architect SQL Code Generation
-- Project :      DATA MODEL
--
-- Date Created : Wednesday, February 26, 2020 03:42:14
-- Target DBMS : MySQL 5.x
--

-- 
-- TABLE: Dim_Date 
--

CREATE TABLE Dim_Date(
    DateKey                 INT            NOT NULL,
    FullDateAlternateKey    DATE,
    DayNumberofMonth        TINYINT        NOT NULL,
    MonthName               VARCHAR(10)    NOT NULL,
    MonthNumberOfYear       TINYINT        NOT NULL,
    CalenderYear            SMALLINT       NOT NULL,
    FiscalQuarter           TINYINT        NOT NULL,
    CalenderQuarter         TINYINT        NOT NULL,
    FiscalYear              SMALLINT       NOT NULL,
    PRIMARY KEY (DateKey)
)ENGINE=MYISAM
;



-- 
-- TABLE: Dim_geography 
--

CREATE TABLE Dim_geography(
    Geography_Durable_Sk         INT                     AUTO_INCREMENT,
    City                         VARCHAR(30),
    StateProvinceCode            NATIONAL VARCHAR(10)    NOT NULL,
    IsOnlyStateProvinceFlag      INT,
    StateProvinceName            VARCHAR(50),
    CountryRegionName            VARCHAR(50),
    CountryRegionCode            VARCHAR(10),
    PostalCode                   VARCHAR(15),
    DI_JobID                     VARCHAR(50),
    DI_CreatedDate               DATETIME,
    DI_ModifiedDate              DATETIME,
    SalesTerritory_Durable_SK    INT,
    PRIMARY KEY (Geography_Durable_Sk)
)ENGINE=MYISAM
;



-- 
-- TABLE: Dim_location 
--

CREATE TABLE Dim_location(
    Location_Durable_SK       INT               NOT NULL,
    DimProductInventoryKey    INT,
    ProductKey                INT,
    DI_Modified_Date          DATETIME,
    DI_Created_Date           DATETIME,
    DI_Job_id                 VARCHAR(10),
    LocationID                INT               NOT NULL,
    LocationName              VARCHAR(50)       NOT NULL,
    CostRate                  DECIMAL(15, 2)    NOT NULL,
    Availability              DECIMAL(8, 2)     NOT NULL,
    ModifiedDate              DATETIME          NOT NULL,
    PRIMARY KEY (Location_Durable_SK)
)ENGINE=MYISAM
;



-- 
-- TABLE: Dim_payhistory 
--

CREATE TABLE Dim_payhistory(
    PayHistory_Durable_SK    INT               NOT NULL,
    Employee_durable_sk      INT               NOT NULL,
    DI_MODIFIED_DATE         DATETIME,
    DI_JOB_ID                VARCHAR(10),
    DI_CREATED_ID            DATETIME,
    Rate                     DECIMAL(15, 2)    NOT NULL,
    PayFrequency             INT               NOT NULL,
    ModifiedDate             DATETIME          NOT NULL,
    scd_start                DATETIME,
    scd_end                  DATETIME,
    scd_Version              INT,
    scd_Active               INT,
    PRIMARY KEY (PayHistory_Durable_SK, Employee_durable_sk)
)ENGINE=MYISAM
;



-- 
-- TABLE: Dim_product 
--

CREATE TABLE Dim_product(
    ProductKey                INT               AUTO_INCREMENT,
    ProductID                 INT               NOT NULL,
    Name                      VARCHAR(50)       NOT NULL,
    ProductModelName          VARCHAR(50),
    ProductCategoryName       VARCHAR(50),
    ProductSubCategoryName    VARCHAR(50),
    ProductNumber             VARCHAR(25)       NOT NULL,
    MakeFlag                  TINYINT           NOT NULL,
    FinishedGoodsFlag         TINYINT           NOT NULL,
    Color                     VARCHAR(15),
    SafetyStockLevel          SMALLINT          NOT NULL,
    ReorderPoint              SMALLINT          NOT NULL,
    StandardCost              DECIMAL(18, 4)    NOT NULL,
    ListPrice                 DECIMAL(18, 4)    NOT NULL,
    Size                      VARCHAR(5),
    Weight                    DECIMAL(8, 2),
    DaysToManufacture         INT               NOT NULL,
    ProductLine               VARCHAR(2),
    Class                     VARCHAR(2),
    Style                     VARCHAR(2),
    SellStartDate             DATETIME          NOT NULL,
    SellEndDate               DATETIME,
    DiscontinuedDate          DATETIME,
    ModifiedDate              DATETIME          NOT NULL,
    DI_JobID                  VARCHAR(50),
    DI_CreatedDate            DATETIME,
    DI_ModifiedDate           DATETIME,
    PRIMARY KEY (ProductKey)
)ENGINE=MYISAM
;



-- 
-- TABLE: Dim_product_costhistory 
--

CREATE TABLE Dim_product_costhistory(
    ProductCostPrice_durable_sk    BIGINT            AUTO_INCREMENT,
    ProductKey                     INT               NOT NULL,
    StandardCost                   DECIMAL(18, 4)    NOT NULL,
    EffectiveStartDate             DATETIME          NOT NULL,
    EffectiveEndDate               DATETIME,
    CurrentIndicator               INT               NOT NULL,
    ModifiedDate                   DATETIME          NOT NULL,
    DI_JobID                       VARCHAR(50),
    DI_CREATEDDATE                 DATETIME,
    DI_ModifiedDate                DATETIME,
    PRIMARY KEY (ProductCostPrice_durable_sk, ProductKey)
)ENGINE=MYISAM
;



-- 
-- TABLE: Dim_productinventory 
--

CREATE TABLE Dim_productinventory(
    DimProductInventoryKey    INT            AUTO_INCREMENT,
    ProductKey                INT            NOT NULL,
    ProductID                 INT            NOT NULL,
    Shelf                     VARCHAR(10)    NOT NULL,
    Bin                       TINYINT        NOT NULL,
    Quantity                  SMALLINT       NOT NULL,
    ModifiedDate              DATETIME       NOT NULL,
    DI_JobID                  VARCHAR(50),
    DI_CreatedDate            DATETIME,
    DI_ModifiedDate           DATETIME,
    PRIMARY KEY (DimProductInventoryKey, ProductKey)
)ENGINE=MYISAM
;



-- 
-- TABLE: Dim_productvendor 
--

CREATE TABLE Dim_productvendor(
    VendorKey          INT               NOT NULL,
    ProductKey         INT               NOT NULL,
    AverageLeadTime    INT               NOT NULL,
    StandardPrice      DECIMAL(18, 4)    NOT NULL,
    LastReceiptCost    DECIMAL(18, 4),
    LastReceiptDate    DATETIME,
    MinOrderQty        INT               NOT NULL,
    MaxOrderQty        INT               NOT NULL,
    OnOrderQty         INT,
    ModifiedDate       DATETIME          NOT NULL,
    DI_JobID           VARCHAR(50),
    DI_CreatedDate     DATETIME,
    DI_ModifiedDate    DATETIME,
    PRIMARY KEY (VendorKey, ProductKey)
)ENGINE=MYISAM
;



-- 
-- TABLE: dim_rejectcodes 
--

CREATE TABLE dim_rejectcodes(
    DI_Reject_SK            INT          NOT NULL,
    DI_RejectCode           INT          NOT NULL,
    DI_RejectReason         CHAR(80),
    DI_RejectDescription    CHAR(255),
    PRIMARY KEY (DI_Reject_SK)
)ENGINE=MYISAM
;



-- 
-- TABLE: Dim_salesterritory 
--

CREATE TABLE Dim_salesterritory(
    SalesTerritory_Durable_SK    INT                     AUTO_INCREMENT,
    TerritoryID                  INT                     NOT NULL,
    SalesTerritoryName           VARCHAR(50)             NOT NULL,
    CountryRegionCode            VARCHAR(3)              NOT NULL,
    SalesGroup                   VARCHAR(50)             NOT NULL,
    SalesTerritoryGroup          NATIONAL VARCHAR(10),
    SalesYTD                     DECIMAL(18, 4)          NOT NULL,
    CostYTD                      DECIMAL(18, 4)          NOT NULL,
    CostLastYear                 DECIMAL(18, 4)          NOT NULL,
    ModifiedDate                 DATETIME                NOT NULL,
    DI_JobID                     VARCHAR(50),
    DI_CreatedDate               DATETIME,
    DI_ModifiedDate              DATETIME,
    PRIMARY KEY (SalesTerritory_Durable_SK)
)ENGINE=MYISAM
;



-- 
-- TABLE: Dim_shipmethod 
--

CREATE TABLE Dim_shipmethod(
    ShipMethod_durable_sk    INT               NOT NULL,
    ShipMethodID             INT               NOT NULL,
    ShipMethodName           VARCHAR(50)       NOT NULL,
    ShipBase                 DECIMAL(15, 2)    NOT NULL,
    ShipRate                 DECIMAL(15, 2)    NOT NULL,
    DI_JOB_ID                VARCHAR(10),
    DI_CREATED_DATE          DATETIME,
    DI_MODIFIED_DATE         DATETIME,
    PRIMARY KEY (ShipMethod_durable_sk)
)ENGINE=MYISAM
;



-- 
-- TABLE: Dim_sorsystem 
--

CREATE TABLE Dim_sorsystem(
    SOR_ID             INT             NOT NULL,
    SOR_Name           CHAR(20),
    SOR_Description    CHAR(80),
    SOR_Type           VARCHAR(80),
    SOR_DBMS           VARCHAR(80),
    SOR_DBName         VARCHAR(80),
    SOR_DBSchema       VARCHAR(80),
    SOR_FileType       VARCHAR(80),
    SOR_Filename       VARCHAR(255),
    SOR_AppName        VARCHAR(255),
    SOR_AppModule      VARCHAR(255),
    PRIMARY KEY (SOR_ID)
)ENGINE=MYISAM
;



-- 
-- TABLE: Dim_vendor 
--

CREATE TABLE Dim_vendor(
    VendorKey                INT            AUTO_INCREMENT,
    GeographyKey             INT            NOT NULL,
    VendorID                 INT            NOT NULL,
    Name                     VARCHAR(50)    NOT NULL,
    PreferredVendorStatus    TINYINT        NOT NULL,
    CreditRate               TINYINT        NOT NULL,
    ActiveFlag               BIT(1)         NOT NULL,
    AddressLine1             VARCHAR(60),
    AddressLine2             VARCHAR(60),
    ModifiedDate             DATETIME       NOT NULL,
    DI_JobID                 VARCHAR(50),
    DI_CreatedDate           DATETIME,
    DI_ModifiedDate          DATETIME,
    PRIMARY KEY (VendorKey)
)ENGINE=MYISAM
;



-- 
-- TABLE: Dim_vendorcontacts 
--

CREATE TABLE Dim_vendorcontacts(
    VendorContacts_Durable_SK    INT            AUTO_INCREMENT,
    VendorKey                    INT            NOT NULL,
    BusinessEntity_ID            INT,
    FirstName                    VARCHAR(50)    NOT NULL,
    MiddleName                   VARCHAR(50),
    LastName                     VARCHAR(50)    NOT NULL,
    Suffix                       VARCHAR(10),
    phoneNumber                  VARCHAR(25),
    EmailAddress                 VARCHAR(50),
    DI_JobID                     VARCHAR(50),
    DI_CreatedDate               DATETIME,
    DI_ModifiedDate              DATETIME,
    PRIMARY KEY (VendorContacts_Durable_SK, VendorKey)
)ENGINE=MYISAM
;



-- 
-- TABLE: dimemployee 
--

CREATE TABLE dimemployee(
    Employee_durable_sk     INT               NOT NULL,
    Geography_Durable_Sk    INT,
    BusinessEntityID        INT               NOT NULL,
    EmployeeNationalID      VARCHAR(15),
    AddressLine1            VARCHAR(60),
    AddressLine2            VARCHAR(60),
    AddressType             VARCHAR(50),
    FirstName               VARCHAR(50)       NOT NULL,
    LastName                VARCHAR(50)       NOT NULL,
    MiddleName              VARCHAR(50),
    HireDate                DATE,
    BirthDate               DATE,
    EmailAddress            VARCHAR(50),
    Phone                   VARCHAR(25),
    SalariedFlag            INT,
    Gender                  CHAR(1),
    PayFrequency            INT,
    BaseRate                DECIMAL(15, 2),
    CurrentFlag             INT               NOT NULL,
    SalesPersonFlag         INT               NOT NULL,
    DepartmentName          VARCHAR(50),
    StartDate               DATE,
    EndDate                 DATE,
    Status                  VARCHAR(50),
    DI_JOB_ID               VARCHAR(10),
    DI_MODIFIED_DATE        DATETIME,
    DI_CREATED_DATE         VARCHAR(10),
    PRIMARY KEY (Employee_durable_sk)
)ENGINE=MYISAM
;



-- 
-- TABLE: DimListpricehistory 
--

CREATE TABLE DimListpricehistory(
    ProductListpricehistory_durable_sk    INT               NOT NULL,
    ProductKey                            INT               NOT NULL,
    DI_JOB_ID                             VARCHAR(10),
    DI_MODIFIED_DATE                      DATETIME,
    DI_CREATED_DATE                       DATETIME,
    ProductSK                             INT,
    ListPrice                             DECIMAL(15, 2)    NOT NULL,
    ModifiedDate                          DATETIME          NOT NULL,
    scd_start                             DATETIME,
    scd_end                               DATETIME,
    scd_Version                           INT,
    scd_Active                            INT,
    PRIMARY KEY (ProductListpricehistory_durable_sk, ProductKey)
)ENGINE=MYISAM
;



-- 
-- TABLE: dimscrapreason 
--

CREATE TABLE dimscrapreason(
    ScrapReasonSK       INT            NOT NULL,
    ScrapReasonID       INT            NOT NULL,
    ScrapReasonName     VARCHAR(50)    NOT NULL,
    DI_JOB_ID           VARCHAR(10),
    DI_MODIFIED_DATE    DATETIME,
    DI_CREATED_DATE     DATETIME,
    PRIMARY KEY (ScrapReasonSK)
)ENGINE=MYISAM
;



-- 
-- TABLE: Fact_purchases 
--

CREATE TABLE Fact_purchases(
    Purchase_Durable_SK           INT               NOT NULL,
    DateKey                       INT               NOT NULL,
    ProductKey                    INT               NOT NULL,
    ShipMethod_durable_sk         INT               NOT NULL,
    Employee_durable_sk           INT               NOT NULL,
    VendorKey                     INT               NOT NULL,
    Purchase_reject_Durable_Sk    INT               NOT NULL,
    PurchaseOrderID               INT               NOT NULL,
    PurchaseOrderDetailID         INT               NOT NULL,
    Status                        INT               NOT NULL,
    EmployeeID                    INT               NOT NULL,
    VendorID                      INT               NOT NULL,
    ShipMethodID                  INT               NOT NULL,
    OrderDate                     DATETIME          NOT NULL,
    ShipDate                      DATETIME,
    SubTotal                      DECIMAL(15, 2)    NOT NULL,
    TaxAmt                        DECIMAL(15, 2)    NOT NULL,
    Freight                       DECIMAL(15, 2)    NOT NULL,
    TotalDue                      DECIMAL(15, 2)    NOT NULL,
    DueDate                       DATETIME          NOT NULL,
    OrderQty                      INT               NOT NULL,
    UnitPrice                     DECIMAL(15, 2)    NOT NULL,
    LineTotal                     DECIMAL(15, 2)    NOT NULL,
    ReceivedQty                   INT               NOT NULL,
    RejectedQty                   INT               NOT NULL,
    StockedQty                    INT               NOT NULL,
    LineTaxAmount                 DECIMAL(15, 2)    NOT NULL,
    LineFreight                   DECIMAL(15, 2)    NOT NULL,
    LineTotalDue                  DECIMAL(15, 2),
    DI_JOB_ID                     VARCHAR(10),
    DI_MODIFIED_DATE              DATETIME,
    DI_CREATED_DATE               DATETIME,
    PRIMARY KEY (Purchase_Durable_SK, DateKey, ProductKey, ShipMethod_durable_sk, Employee_durable_sk, VendorKey, Purchase_reject_Durable_Sk)
)ENGINE=MYISAM
;



-- 
-- TABLE: fact_workorder 
--

CREATE TABLE fact_workorder(
    WorkOrder_Durable_SK     INT            NOT NULL,
    ScrapReasonSK            INT            NOT NULL,
    ProductKey               INT            NOT NULL,
    WorkOrderRoutingSK       INT            NOT NULL,
    WorkOrderID              INT            NOT NULL,
    OrderQty                 INT            NOT NULL,
    StockedQty               INT            DEFAULT 0 NOT NULL,
    ScrappedQty              INT            NOT NULL,
    WorkOrder_StartDateSK    INT            NOT NULL,
    WorkOrder_EndDateSK      INT,
    WorkOrder_DueDateSK      INT            NOT NULL,
    StartDate                DATETIME       NOT NULL,
    EndDate                  DATETIME,
    DueDate                  DATETIME       NOT NULL,
    DI_JOB_ID                VARCHAR(10),
    DI_MODIFIED_DATE         DATETIME,
    DI_CREATED_DATE          DATETIME,
    PRIMARY KEY (WorkOrder_Durable_SK, ScrapReasonSK, ProductKey, WorkOrderRoutingSK)
)ENGINE=MYISAM
;



-- 
-- TABLE: fact_workorder_rejects 
--

CREATE TABLE fact_workorder_rejects(
    RejectWorkOrderRouting_Durable_SK    INT            NOT NULL,
    WorkOrderID                          INT,
    OrderQty                             INT,
    StockedQty                           INT            DEFAULT 0,
    ScrappedQty                          INT,
    WorkOrder_StartDateSK                INT,
    WorkOrder_EndDateSK                  INT,
    WorkOrder_DueDateSK                  INT,
    StartDate                            DATETIME,
    EndDate                              DATETIME,
    DueDate                              DATETIME,
    ProductID                            INT,
    DI_JOB_ID                            VARCHAR(10),
    DI_CREATED_DATE                      DATETIME,
    DI_MODIFIED_DATE                     DATETIME,
    WorkOrder_Durable_SK                 INT,
    ScrapReasonSK                        INT,
    ProductKey                           INT,
    WorkOrderRoutingSK                   INT,
    PRIMARY KEY (RejectWorkOrderRouting_Durable_SK)
)ENGINE=MYISAM
;



-- 
-- TABLE: fact_workorderrouting 
--

CREATE TABLE fact_workorderrouting(
    WorkOrderRoutingSK      INT               NOT NULL,
    OperationSequence       INT               NOT NULL,
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
    DI_JOB_ID               VARCHAR(10),
    DI_CREATED_DATE         DATETIME,
    DI_MODIFIED_DATE        DATETIME,
    Location_Durable_SK     INT,
    PRIMARY KEY (WorkOrderRoutingSK)
)ENGINE=MYISAM
;



-- 
-- TABLE: factpurchases_rejects 
--

CREATE TABLE factpurchases_rejects(
    Purchase_reject_Durable_Sk    INT               NOT NULL,
    Employee_durable_sk           INT               NOT NULL,
    ShipMethod_durable_sk         INT               NOT NULL,
    PurchaseOrderID               INT,
    PurchaseOrderDetailID         INT,
    Status                        INT,
    EmployeeID                    INT,
    VendorID                      INT,
    ShipMethodID                  INT,
    OrderDate                     DATETIME,
    ShipDate                      DATETIME,
    SubTotal                      DECIMAL(15, 2),
    TaxAmt                        DECIMAL(15, 2),
    Freight                       DECIMAL(15, 2),
    TotalDue                      DECIMAL(15, 2),
    DueDate                       DATETIME,
    OrderQty                      INT,
    UnitPrice                     DECIMAL(15, 2),
    LineTotal                     DECIMAL(15, 2),
    ReceivedQty                   INT,
    RejectedQty                   INT,
    StockedQty                    INT,
    LineTaxAmount                 DECIMAL(15, 2),
    LineFreight                   DECIMAL(15, 2),
    LineTotalDue                  DECIMAL(15, 2),
    DI_JOB_ID                     VARCHAR(10),
    DI_CREATED_DATE               DATETIME,
    DI_MODIFIED_DATE              DATETIME,
    PRIMARY KEY (Purchase_reject_Durable_Sk, Employee_durable_sk, ShipMethod_durable_sk)
)ENGINE=MYISAM
;



-- 
-- TABLE: Dim_geography 
--

ALTER TABLE Dim_geography ADD CONSTRAINT RefDim_salesterritory16 
    FOREIGN KEY (SalesTerritory_Durable_SK)
    REFERENCES Dim_salesterritory(SalesTerritory_Durable_SK) ON DELETE RESTRICT ON UPDATE RESTRICT
;


-- 
-- TABLE: Dim_location 
--

ALTER TABLE Dim_location ADD CONSTRAINT RefDim_productinventory23 
    FOREIGN KEY (DimProductInventoryKey, ProductKey)
    REFERENCES Dim_productinventory(DimProductInventoryKey, ProductKey) ON DELETE RESTRICT ON UPDATE RESTRICT
;


-- 
-- TABLE: Dim_payhistory 
--

ALTER TABLE Dim_payhistory ADD CONSTRAINT Refdimemployee1 
    FOREIGN KEY (Employee_durable_sk)
    REFERENCES dimemployee(Employee_durable_sk) ON DELETE RESTRICT ON UPDATE RESTRICT
;


-- 
-- TABLE: Dim_product_costhistory 
--

ALTER TABLE Dim_product_costhistory ADD CONSTRAINT RefDim_product2 
    FOREIGN KEY (ProductKey)
    REFERENCES Dim_product(ProductKey) ON DELETE RESTRICT ON UPDATE RESTRICT
;


-- 
-- TABLE: Dim_productinventory 
--

ALTER TABLE Dim_productinventory ADD CONSTRAINT RefDim_product14 
    FOREIGN KEY (ProductKey)
    REFERENCES Dim_product(ProductKey) ON DELETE RESTRICT ON UPDATE RESTRICT
;


-- 
-- TABLE: Dim_productvendor 
--

ALTER TABLE Dim_productvendor ADD CONSTRAINT RefDim_vendor10 
    FOREIGN KEY (VendorKey)
    REFERENCES Dim_vendor(VendorKey) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE Dim_productvendor ADD CONSTRAINT RefDim_product12 
    FOREIGN KEY (ProductKey)
    REFERENCES Dim_product(ProductKey) ON DELETE RESTRICT ON UPDATE RESTRICT
;


-- 
-- TABLE: Dim_vendorcontacts 
--

ALTER TABLE Dim_vendorcontacts ADD CONSTRAINT RefDim_vendor9 
    FOREIGN KEY (VendorKey)
    REFERENCES Dim_vendor(VendorKey) ON DELETE RESTRICT ON UPDATE RESTRICT
;


-- 
-- TABLE: dimemployee 
--

ALTER TABLE dimemployee ADD CONSTRAINT RefDim_geography15 
    FOREIGN KEY (Geography_Durable_Sk)
    REFERENCES Dim_geography(Geography_Durable_Sk) ON DELETE RESTRICT ON UPDATE RESTRICT
;


-- 
-- TABLE: DimListpricehistory 
--

ALTER TABLE DimListpricehistory ADD CONSTRAINT RefDim_product3 
    FOREIGN KEY (ProductKey)
    REFERENCES Dim_product(ProductKey) ON DELETE RESTRICT ON UPDATE RESTRICT
;


-- 
-- TABLE: Fact_purchases 
--

ALTER TABLE Fact_purchases ADD CONSTRAINT RefDim_Date17 
    FOREIGN KEY (DateKey)
    REFERENCES Dim_Date(DateKey) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE Fact_purchases ADD CONSTRAINT RefDim_product18 
    FOREIGN KEY (ProductKey)
    REFERENCES Dim_product(ProductKey) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE Fact_purchases ADD CONSTRAINT RefDim_shipmethod19 
    FOREIGN KEY (ShipMethod_durable_sk)
    REFERENCES Dim_shipmethod(ShipMethod_durable_sk) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE Fact_purchases ADD CONSTRAINT Refdimemployee20 
    FOREIGN KEY (Employee_durable_sk)
    REFERENCES dimemployee(Employee_durable_sk) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE Fact_purchases ADD CONSTRAINT RefDim_vendor21 
    FOREIGN KEY (VendorKey)
    REFERENCES Dim_vendor(VendorKey) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE Fact_purchases ADD CONSTRAINT Reffactpurchases_rejects33 
    FOREIGN KEY (Purchase_reject_Durable_Sk, Employee_durable_sk, ShipMethod_durable_sk)
    REFERENCES factpurchases_rejects(Purchase_reject_Durable_Sk, Employee_durable_sk, ShipMethod_durable_sk) ON DELETE RESTRICT ON UPDATE RESTRICT
;


-- 
-- TABLE: fact_workorder 
--

ALTER TABLE fact_workorder ADD CONSTRAINT Refdimscrapreason6 
    FOREIGN KEY (ScrapReasonSK)
    REFERENCES dimscrapreason(ScrapReasonSK) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE fact_workorder ADD CONSTRAINT RefDim_product24 
    FOREIGN KEY (ProductKey)
    REFERENCES Dim_product(ProductKey) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE fact_workorder ADD CONSTRAINT Reffact_workorderrouting29 
    FOREIGN KEY (WorkOrderRoutingSK)
    REFERENCES fact_workorderrouting(WorkOrderRoutingSK) ON DELETE RESTRICT ON UPDATE RESTRICT
;


-- 
-- TABLE: fact_workorder_rejects 
--

ALTER TABLE fact_workorder_rejects ADD CONSTRAINT Reffact_workorder30 
    FOREIGN KEY (WorkOrder_Durable_SK, ScrapReasonSK, ProductKey, WorkOrderRoutingSK)
    REFERENCES fact_workorder(WorkOrder_Durable_SK, ScrapReasonSK, ProductKey, WorkOrderRoutingSK) ON DELETE RESTRICT ON UPDATE RESTRICT
;


-- 
-- TABLE: fact_workorderrouting 
--

ALTER TABLE fact_workorderrouting ADD CONSTRAINT RefDim_location28 
    FOREIGN KEY (Location_Durable_SK)
    REFERENCES Dim_location(Location_Durable_SK) ON DELETE RESTRICT ON UPDATE RESTRICT
;


-- 
-- TABLE: factpurchases_rejects 
--

ALTER TABLE factpurchases_rejects ADD CONSTRAINT Refdimemployee34 
    FOREIGN KEY (Employee_durable_sk)
    REFERENCES dimemployee(Employee_durable_sk) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE factpurchases_rejects ADD CONSTRAINT RefDim_shipmethod35 
    FOREIGN KEY (ShipMethod_durable_sk)
    REFERENCES Dim_shipmethod(ShipMethod_durable_sk) ON DELETE RESTRICT ON UPDATE RESTRICT
;


