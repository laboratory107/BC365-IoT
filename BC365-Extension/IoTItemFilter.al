pageextension 50019 IoTItemExt extends "Item List"
{
    actions
    {
        addfirst(reporting)
        {
            action(setfilter)
            {
                caption = 'Show endangered items';
                ApplicationArea = all;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                trigger OnAction()
                var
                    tempData: Record IoTData;
                begin
                    tempData.FindLast();
                    rec.setRange(MaxTemperature, 0, tempData.Temperature);
                end;
            }
        }
    }
}