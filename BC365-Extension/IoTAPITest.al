codeunit 50010 IoTApiTest
{
    var
        DataEntry: Record "IoTData";

    procedure Ping(): Text
    begin
        exit('Pong');
    end;

    procedure AddData(luminosity: Integer; humidity: Decimal; temperature: Decimal): Text
    begin
        DataEntry.Init();
        DataEntry.Luminosity := luminosity;
        DataEntry.Humidity := humidity;
        DataEntry.Temperature := temperature;
        DataEntry.MeasuredAt := CURRENTDATETIME;
        DataEntry.Insert();
        exit('OK');
    end;
}