query 50031 "Item Qty. By Location Query"
{

    elements
    {
        dataitem(Item_Ledger_Entry; "Item Ledger Entry")
        {
            column(ItmLdg_Item_No; "Item No.")
            {
            }
            column(ItmLdg_Location_Code; "Location Code")
            {
            }
            column(ItmLdg_Sum_Remaining_Quantity; "Remaining Quantity")
            {
                Method = Sum;
            }
            column(ItmLdg_Open; Open)
            {
                ColumnFilter = ItmLdg_Open = CONST(true);
            }
            column(ItmLdg_Positive; Positive)
            {
                ColumnFilter = ItmLdg_Positive = CONST(true);
            }
            dataitem(Item; Item)
            {
                DataItemLink = "No." = Item_Ledger_Entry."Item No.";
                SqlJoinType = InnerJoin;

                column(Itm_Description; Description)
                {
                }
                column(Itm_Unit_Price; "Unit Price")
                {
                }
                column(Max_Temperature; "Max Temperature")
                {

                }
                dataitem(Location; Location)
                {
                    DataItemLink = Code = Item_Ledger_Entry."Location Code";
                    SqlJoinType = InnerJoin;

                    column(Loc_Code; Code)
                    {
                    }
                    column(Loc_Address; Address)
                    {
                    }
                    column(Loc_City; City)
                    {
                    }
                }
            }
        }
    }
}
