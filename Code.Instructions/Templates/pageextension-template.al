// Page extension Template for Business Central AL Development
// Copy this template and replace placeholders with your specific values
// Following SharedGuidelines naming conventions and page layout standards
pageextension [ObjectID] [Prefix]_[EntityName] extends [EntityName]
{
    layout
    {
        addafter("Address & Contact")
        {
            group("abcABC_Rating Information")
            {
                Caption = 'Rating Information';
                field("abcABC_Customer Category"; Rec."abcABC_Customer Category")
                {
                    ApplicationArea = All;
                }
                field("abcABC_Preferred Contact Method"; Rec."abcABC_Preferred Contact Method")
                {
                    ApplicationArea = All;
                }
                field("abcABC_Last Contact Date"; Rec."abcABC_Last Contact Date")
                {
                    ApplicationArea = All;
                }
                field("abcABC_Total Ratings"; Rec."abcABC_Total Ratings")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "abcABC_Customer Rating List";
                }
            }
        }
    }

    actions
    {
        addafter("&Customer")
        {
            group("abcABC_RatingActions")
            {
                Caption = 'Ratings';
                action("abcABC_CustomerRatings")
                {
                    Caption = 'Customer Ratings';
                    Tooltip = 'View the list of ratings for this customer.';
                    Image = Rates;
                    ApplicationArea = All;
                    RunObject = page "abcABC_Customer Rating List";
                    RunPageLink = "Customer No." = field("No.");
                }
                action("abcABC_NewRating")
                {
                    Caption = 'New Rating';
                    Tooltip = 'Create a new rating for this customer.';
                    Image = New;
                    ApplicationArea = All;

                    trigger OnAction()
                    var
                        CustomerRating: Record "abcABC_Customer Rating";
                        CustomerRatingCard: Page "abcABC_Customer Rating Card";
                    begin
                        CustomerRating.Init();
                        CustomerRating."Customer No." := Rec."No.";
                        CustomerRating."Rating Date" := Today;
                        CustomerRatingCard.SetRecord(CustomerRating);
                        CustomerRatingCard.RunModal();
                    end;
                }
            }
        }
        addafter(Customer_Promoted)
        {
            group("abcABC_RatingPromoted")
            {
                Caption = 'Ratings';
                actionref("abcABC_CustomerRatings_Promoted"; "abcABC_CustomerRatings") { }
                actionref("abcABC_NewRating_Promoted"; "abcABC_NewRating") { }
            }
        }
    }
}