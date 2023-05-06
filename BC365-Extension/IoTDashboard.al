page 50012 IoTDashboard
{
    PageType = Card;
    Caption = 'IoT Data';
    UsageCategory = Administration;
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            usercontrol(Chart; "Microsoft.Dynamics.Nav.Client.BusinessChart")
            {
                ApplicationArea = All;
                trigger AddInReady()
                var
                    Buffer: Record "Business Chart Buffer" temporary;
                    Data: Record "IoTData";
                    i: Integer;
                begin
                    Buffer.Initialize();
                    Buffer.AddMeasure('Temperature', 1, Buffer."Data Type"::Decimal, Buffer."Chart Type"::Line.AsInteger());
                    Buffer.AddMeasure('Humidity', 1, Buffer."Data Type"::Decimal, Buffer."Chart Type"::Line.AsInteger());
                    Buffer.SetXAxis('MeasuredAt', Buffer."Data Type"::DateTime);

                    if Data.FindSet() then
                        repeat
                            Buffer.AddColumn(Data.MeasuredAt);
                            Buffer.SetValueByIndex(0, i, Data.Temperature);
                            Buffer.SetValueByIndex(1, i, Data.Humidity);
                            i += 1;
                        until Data.Next() = 0;
                    Buffer.Update(CurrPage.Chart);
                end;
            }
        }
    }
}