pageextension 50005 PageExtensionIoT extends "Item Card"
{
    layout
    {
        addafter("Purchasing Code")
        {
            field(MaxTemperature; Rec.MaxTemperature)
            {
                ApplicationArea = all;
            }
        }
    }
}