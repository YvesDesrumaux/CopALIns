// Report Template for Business Central AL Development
// Copy this template and replace placeholders with your specific values
// Following SharedGuidelines naming conventions and page layout standards
report  [Prefix]_[EntityName]
{
    Caption = '[EntityName] Report';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    ProcessingOnly = false;
    UseRequestPage = true;

    dataset
    {
        dataitem(Customer; Customer)
        {
            RequestFilterFields = "No.", Name, "Customer Posting Group";
            column(Customer_No; "No.")
            {
                IncludeCaption = true;
            }
            column(Customer_Name; Name)
            {
                IncludeCaption = true;
            }
            column(Customer_Phone; "Phone No.")
            {
                IncludeCaption = true;
            }
            column(Customer_Email; "E-Mail")
            {
                IncludeCaption = true;
            }
            column(Customer_Category; "ABC Customer Category")
            {
                IncludeCaption = true;
            }
            column(Customer_LastContactDate; "ABC Last Contact Date")
            {
                IncludeCaption = true;
            }
            column(Customer_TotalRatings; TotalRatings) { }
            column(Customer_AverageRating; AverageRating) {}

            dataitem("ABC Customer Rating"; "ABC Customer Rating")
            {
                DataItemLink = "Customer No." = field("No.");
                column(Rating_Date; "Rating Date")
                {
                    IncludeCaption = true;
                }
                column(Rating_Score; "Rating Score")
                {
                    IncludeCaption = true;
                }
                column(Rating_Category; "Rating Category")
                {
                    IncludeCaption = true;
                }
                column(Rating_Comments; Comments)
                {
                    IncludeCaption = true;
                }

                trigger OnAfterGetRecord()
                begin
                    RatingCount += 1;
                    TotalScore += "Rating Score";
                end;
            }

            trigger OnAfterGetRecord()
            var
                CustomerRatingMgt: Codeunit "ABC Customer Rating Mgt";
            begin
                CalcFields("ABC Total Ratings");
                TotalRatings := "ABC Total Ratings";
                AverageRating := CustomerRatingMgt.CalculateAverageRating("No.");

                // Initialize counters for this customer
                RatingCount := 0;
                TotalScore := 0;
            end;

            trigger OnPreDataItem()
            begin
                if CompanyName <> '' then
                    CompanyInformation.Get();
            end;
        }
    }

    requestpage
    {
        SaveValues = true;

        layout
        {
            area(Content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field(MinimumRatingScore; MinimumRatingScore)
                    {
                        Caption = 'Minimum Rating Score';
                        ApplicationArea = All;
                        MinValue = 1;
                        MaxValue = 5;
                        Tooltip = 'Specifies the minimum rating score to include in the report.';
                    }
                    field(IncludeRatingDetails; IncludeRatingDetails)
                    {
                        Caption = 'Include Rating Details';
                        ApplicationArea = All;
                        Tooltip = 'Specifies whether to include individual rating details for each customer.';
                    }
                    group(DateFilter)
                    {
                        Caption = 'Date Filter';
                        field(DateFilterFrom; DateFilterFrom)
                        {
                            Caption = 'From Date';
                            ApplicationArea = All;
                            Tooltip = 'Specifies the start date for the rating date filter.';
                        }
                        field(DateFilterTo; DateFilterTo)
                        {
                            Caption = 'To Date';
                            ApplicationArea = All;
                            Tooltip = 'Specifies the end date for the rating date filter.';
                        }
                    }
                }
            }
        }

        trigger OnOpenPage()
        begin
            if DateFilterFrom = 0D then
                DateFilterFrom := CalcDate('<-1Y>', Today);
            if DateFilterTo = 0D then
                DateFilterTo := Today;
        end;
    }

    rendering
    {
        layout("[EntityName] Report")
        {
            Type = RDLC;
            LayoutFile = './Layouts/[EntityName]Report.rdlc';
        }
    }

    labels
    {
        ReportTitle = '[EntityName] Report';
        CompanyName = 'Company Name';
        PrintDate = 'Print Date';
        CustomerNo = 'Customer No.';
        CustomerName = 'Customer Name';
        TotalRatingsLabel = 'Total Ratings';
        AverageRatingLabel = 'Average Rating';
    }

    trigger OnInitReport()
    begin
        MinimumRatingScore := 1;
        IncludeRatingDetails := true;
    end;

    trigger OnPreReport()
    begin
        CustomerFilter := Customer.GetFilters;
        if (DateFilterFrom <> 0D) or (DateFilterTo <> 0D) then begin
            Customer.SetFilter("ABC Customer Rating"."Rating Date", '%1..%2', DateFilterFrom, DateFilterTo);
        end;

        if MinimumRatingScore > 1 then
            Customer.SetFilter("ABC Customer Rating"."Rating Score", '>=%1', MinimumRatingScore);
    end;

    var
        CompanyInformation: Record "Company Information";
        MinimumRatingScore: Integer;
        IncludeRatingDetails: Boolean;
        DateFilterFrom: Date;
        DateFilterTo: Date;
        CustomerFilter: Text;
        TotalRatings: Integer;
        AverageRating: Decimal;
        RatingCount: Integer;
        TotalScore: Integer;
}

// Processing-Only Report Template for Business Central AL Development
// Copy this template and replace placeholders with your specific values
// Following SharedGuidelines naming conventions and page layout standards
report [ObjectID] [Prefix]Update[EntityName]
{
    Caption = 'Update [EntityName]';
    ProcessingOnly = true;
    UseRequestPage = true;

    dataset
    {
        dataitem(Customer; Customer)
        {
            RequestFilterFields = "No.", "Customer Posting Group";

            trigger OnAfterGetRecord()
            var
                CustomerRatingMgt: Codeunit "ABC Customer Rating Mgt";
                AverageRating: Decimal;
                NewCategory: Enum "ABC Customer Category";
            begin
                AverageRating := CustomerRatingMgt.CalculateAverageRating("No.");

                // Determine new category based on average rating
                case true of
                    AverageRating >= 4.5:
                        NewCategory := "abcABC_CustomerCategory"::Premium;
                    AverageRating >= 3.5:
                        NewCategory := "abcABC_CustomerCategory"::Standard;
                    AverageRating >= 2.0:
                        NewCategory := "abcABC_CustomerCategory"::Basic;
                    else
                        NewCategory := "abcABC_CustomerCategory"::Review;
                end;

                if "abcABC_CustomerCategory" <> NewCategory then begin
                    if not PreviewMode then begin
                        "abcABC_CustomerCategory" := NewCategory;
                        Modify(true);
                        CustomersUpdated += 1;
                    end else
                        CustomersToUpdate += 1;
                end;

                CustomersProcessed += 1;
                Window.Update(1, Round(CustomersProcessed / TotalCustomers * 10000, 1));
                Window.Update(2, "No.");
            end;

            trigger OnPostDataItem()
            var
                PreviewTxt: label 'Preview completed. %1 [EntityName]s would be updated.',comments= '%1 = Number of [EntityName]s to be updated in preview mode.';
                ProcessedTxt: label 'Process completed. %1 [EntityName]s updated out of %2 processed.',comments= '%1 = Number of [EntityName]s updated, %2 = Number of [EntityName]s processed.';
            begin
                Window.Close();
                
                if PreviewMode then
                    Message(PreviewTxt, CustomersToUpdate)
                else
                    Message(ProcessedTxt, CustomersUpdated, CustomersProcessed);
            end;

            trigger OnPreDataItem()
            var
                ProgressText: label 'Processing Customers...\' +
                                    'Progress: #1########## %\' +
                                    'Current Customer: #2##########',
                                    comments= '%1 = Progress percentage, %2 = Current Customer No.';
            begin
                TotalCustomers := Count;
                CustomersProcessed := 0;
                CustomersUpdated := 0;
                CustomersToUpdate := 0;

                Window.Open(ProgressText);
            end;
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field(PreviewMode; PreviewMode)
                    {
                        Caption = 'Preview Mode';
                        ApplicationArea = All;
                        Tooltip = 'Specifies whether to run in preview mode without making changes.';
                    }
                    group(CategoryRules)
                    {
                        Caption = 'Category Assignment Rules';
                        field(PremiumThreshold; PremiumThreshold)
                        {
                            Caption = 'Premium Threshold';
                            ApplicationArea = All;
                            DecimalPlaces = 1 : 2;
                            MinValue = 1;
                            MaxValue = 5;
                            Tooltip = 'Specifies the minimum average rating for Premium category.';
                        }
                        field(StandardThreshold; StandardThreshold)
                        {
                            Caption = 'Standard Threshold';
                            ApplicationArea = All;
                            DecimalPlaces = 1 : 2;
                            MinValue = 1;
                            MaxValue = 5;
                            Tooltip = 'Specifies the minimum average rating for Standard category.';
                        }
                    }
                }
            }
        }

        trigger OnOpenPage()
        begin
            PreviewMode := true;
            PremiumThreshold := 4.5;
            StandardThreshold := 3.5;
        end;
    }

    var
        Window: Dialog;
        PreviewMode: Boolean;
        PremiumThreshold: Decimal;
        StandardThreshold: Decimal;
        TotalCustomers: Integer;
        CustomersProcessed: Integer;
        CustomersUpdated: Integer;
        CustomersToUpdate: Integer;
}