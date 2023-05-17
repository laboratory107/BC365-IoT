table 50032 "Item Qty. By Location Table"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; LineNo; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Item No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3; Description; text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Qty."; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Unit Price"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Location Code"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(7; Address; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(8; City; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Max Temperature"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; LineNo)
        {
            Clustered = true;
        }
    }

}