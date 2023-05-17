pageextension 50025 PageExtensionIoT extends "Item Card"
{
    layout
    {
        addafter("Purchasing Code")
        {
            field(MaxTemperature; Rec."Max Temperature")
            {
                ApplicationArea = all;
            }
        }
    }

    actions
    {
        addlast(Processing)
        {
            action("Item Qty. By Loaction Query")
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    ItemQtyByLoactionRec: Record "Item Qty. By Location Table" temporary;
                    ItemQtyByLoactionQuery: Query "Item Qty. By Location Query";
                    LineNo_Counter: Integer;
                    IoTData: Record IoTDataTable;
                begin

                    LineNo_Counter := 10000;
                    IoTData.FindLast();
                    //ItemQtyByLoactionQuery.SetFilter(ItmLdg_Item_No, Rec."No.");
                    ItemQtyByLoactionQuery.Open();

                    while ItemQtyByLoactionQuery.READ do begin
                        ItemQtyByLoactionRec.LineNo := LineNo_Counter;
                        ItemQtyByLoactionRec."Item No." := ItemQtyByLoactionQuery.ItmLdg_Item_No;
                        ItemQtyByLoactionRec.Description := ItemQtyByLoactionQuery.Itm_Description;
                        ItemQtyByLoactionRec."Qty." := ItemQtyByLoactionQuery.ItmLdg_Sum_Remaining_Quantity;
                        ItemQtyByLoactionRec."Unit Price" := IotData.Temperature;
                        ItemQtyByLoactionRec."Location Code" := ItemQtyByLoactionQuery.ItmLdg_Location_Code;
                        ItemQtyByLoactionRec.Address := ItemQtyByLoactionQuery.Loc_Address;
                        ItemQtyByLoactionRec.City := ItemQtyByLoactionQuery.Loc_City;

                        ItemQtyByLoactionRec.Insert;

                        LineNo_Counter := LineNo_Counter + 10000;
                    end;

                    if ItemQtyByLoactionRec.FindSet then;

                    if Page.RUNMODAL(50033, ItemQtyByLoactionRec) = Action::LookupOK then;

                end;
            }
        }
    }

}