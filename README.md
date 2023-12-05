# handson_webcrawler

{Generate a report. The report must be generated before exporting}
 frxReport1.PrepareReport();
 {Set the range of pages to export. By default, all pages of the generated report are exported}
 frxXLSXExport1.PageNumbers := '2-3';
 {Set whether to generate a continuous document which skips empty rows, headers and footers (with EmptyLines = False).
  With EmptyLines = True the report will be exported as it was generated. Without skipping the empty rows, headers and footers.
  Enabling this option disables TfrxXLSXExport.SuppressPageHeadersFooters and vice versa)}
 frxXLSXExport1.EmptyLines := True;
 {Set whether to export the page breaks within the sheet of the book so that when printing the pages correspond to the pages of the generated report}
 frxXLSXExport1.ExportPageBreaks := True;
 {Set WYSIWYG}
 frxXLSXExport1.Wysiwyg := True;
 {Set whether to export only the content of data bands}
 frxXLSXExport1.DataOnly := False;
 {Set the document splitting order:
  with the SingleSheet option on, all pages of the document will be located on one sheet
  frxXLSXExport1.SingleSheet := True;
  If you set the value to ChunkSize, each sheet will have a specified number of rows.
  In this case SingleSheet should be set to False
  frxXLSXExport1.ChunkSize := 50;
  We will set the default order when each sheet of the generated report corresponds to a sheet of the book}
 frxXLSXExport1.SingleSheet := False;
 frxXLSXExport1.ChunkSize := 0;
 {Set whether to open the resulting file after export}
 frxXLSXExport1.OpenAfterExport := False;
 {Set whether to display export progress
  (show which page is currently being exported)}
 frxXLSXExport1.ShowProgress := False;
 {Set whether to display a dialog box with export filter settings}
 frxXLSXExport1.ShowDialog := False;
 {Set the name of the resulting file.}
 {Please note that if you do not set the file name and disable the export filter dialog box,}
 {the file name selection dialog will still be displayed}
 frxXLSXExport1.FileName := 'C:\Output\test.xlsx';
 {Export the report}
 frxReport1.Export(frxXLSXExport1);
