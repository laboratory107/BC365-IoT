page 50033 "Item Qty. By Location Page"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Item Qty. By Location Table";

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = All;
                }

                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }

                field("Qty."; Rec."Qty.")
                {
                    ApplicationArea = All;
                }

                field("Unit Price"; Rec."Unit Price")
                {
                    ApplicationArea = All;
                }

                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = All;
                }

                field(Address; Rec.Address)
                {
                    Caption = 'Location Address';
                    ApplicationArea = All;
                }

                field(City; Rec.City)
                {
                    Caption = 'Location City';
                    ApplicationArea = All;
                }
            }
        }
    }
}