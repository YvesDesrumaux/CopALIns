tableextension [ObjectID] [Prefix]_[EntityName] extends [EntityName]
{
    fields
    {
        field(50100; "abcABC_PreferredContactMethod"; Code[20])
        {
            Caption = 'Preferred Contact Method';
            Tooltip = 'Specifies the preferred method of contact.';
            DataClassification = CustomerContent;
            TableRelation = "abcABC_ContactMethod";
        }
        field(50101; "abcABC_CustomerCategory"; Enum "abcABC_CustomerCategory")
        {
            Caption = 'Customer Category';
            Tooltip = 'Specifies the business category of this customer.';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                if "abcABC_CustomerCategory" <> xRec."abcABC_CustomerCategory" then
                    UpdateCategoryDependentFields();
            end;
        }
        field(50102; "abcABC_LastContactDate"; Date)
        {
            Caption = 'Last Contact Date';
            Tooltip = 'Specifies the date of the last contact with this customer.';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(50103; "abcABC_TotalRatings"; Integer)
        {
            Caption = 'Total Ratings';
            Tooltip = 'Specifies the total number of ratings for this customer.';
            FieldClass = FlowField;
            CalcFormula = count("abcABC_CustomerRating" where("Customer No." = field("No.")));
            Editable = false;
        }
    }

    keys
    {
        key(abcABC_CustomerCategory; "abcABC_CustomerCategory") { }
    }

    local procedure UpdateCategoryDependentFields()
    begin
        // Update related fields based on customer category
        case "abcABC_CustomerCategory" of
            "abcABC_CustomerCategory"::Premium:
                begin
                    if "abcABC_PreferredContactMethod" = '' then
                        "abcABC_PreferredContactMethod" := 'PHONE';
                end;
            "abcABC_CustomerCategory"::Standard:
                begin
                    if "abcABC_PreferredContactMethod" = '' then
                        "abcABC_PreferredContactMethod" := 'EMAIL';
                end;
        end;
    end;
}