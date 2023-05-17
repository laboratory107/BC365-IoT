table 50021 IoTDataTable
{
    Caption = 'IoT Data Table';
    DataPerCompany = false;

    fields
    {
        field(1; MeasurementID; Integer)
        {
            AutoIncrement = true;
            Description = 'ID';
        }
        field(2; Temperature; Decimal)
        {
            Description = 'Temperature';
        }
        field(3; Humidity; Decimal)
        {
            Description = 'Humidity';
        }
        field(4; Luminosity; Integer)
        {
            Description = 'Luminosity';
        }
        field(5; MeasuredAt; DateTime)
        {
            Description = 'Date';
        }
    }
    keys
    {
        key(PrimaryKey; MeasurementID)
        {
            Clustered = TRUE;
        }
    }
}