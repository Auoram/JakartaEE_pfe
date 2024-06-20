
package Children_Vax;

import java.io.*;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import com.lowagie.text.*;
import com.lowagie.text.pdf.*;
import static java.awt.Color.LIGHT_GRAY;
import java.awt.Color;

public class DownloadRecords extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String childId = request.getParameter("childId");

        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=\"child_records.pdf\"");

        try (ServletOutputStream out = response.getOutputStream()) {
            Connection_Db.Connect();
            Connection conn = Connection_Db.conn;

            Document document = new Document();
            PdfWriter.getInstance(document, out);
            document.open();
            
            Image img = Image.getInstance("C:\\Users\\lenovo\\OneDrive\\Documents\\NetBeansProjects\\My_PFE\\web\\images\\MS-Maroc.png");
            img.scaleToFit(100, 100);
            img.setAlignment(Element.ALIGN_CENTER);
            document.add(img);
            
            Color darkBlue = new Color(0, 0, 139);

            String childQuery = "SELECT * FROM `vax`.`Enfant` WHERE idE = ?";
            PreparedStatement childStmt = conn.prepareStatement(childQuery);
            childStmt.setInt(1, Integer.parseInt(childId));
            ResultSet childRs = childStmt.executeQuery();

            if (childRs.next()) {
                document.add(new Paragraph("Vaccination Record", FontFactory.getFont(FontFactory.HELVETICA_BOLD,24,darkBlue)));
                document.add(new Paragraph(" ", FontFactory.getFont(FontFactory.HELVETICA)));
                document.add(new Paragraph("Child Information", FontFactory.getFont(FontFactory.HELVETICA_BOLD,18,darkBlue)));
                document.add(new Paragraph(" ", FontFactory.getFont(FontFactory.HELVETICA)));
                document.add(new Paragraph("Name: " + childRs.getString("nomCompletE"),FontFactory.getFont(FontFactory.HELVETICA,15)));
                document.add(new Paragraph(" ", FontFactory.getFont(FontFactory.HELVETICA,5)));
                document.add(new Paragraph("Date of Birth: " + childRs.getDate("dateNaiss"),FontFactory.getFont(FontFactory.HELVETICA,15)));
                document.add(new Paragraph(" ", FontFactory.getFont(FontFactory.HELVETICA,5)));
                document.add(new Paragraph("Gender: " + childRs.getString("sexe"),FontFactory.getFont(FontFactory.HELVETICA,15)));
                document.add(new Paragraph(" ", FontFactory.getFont(FontFactory.HELVETICA,5)));
                document.add(new Paragraph("Address: " + childRs.getString("adresseE"),FontFactory.getFont(FontFactory.HELVETICA,15)));
                document.add(new Paragraph(" ", FontFactory.getFont(FontFactory.HELVETICA,5)));
                document.add(new Paragraph("Num SMI: " + childRs.getString("numSMI"),FontFactory.getFont(FontFactory.HELVETICA,15)));
                document.add(new Paragraph(" ", FontFactory.getFont(FontFactory.HELVETICA,5)));
                document.add(new Paragraph("Allergies: " + childRs.getString("allergies"),FontFactory.getFont(FontFactory.HELVETICA,15)));
                document.add(new Paragraph(" ", FontFactory.getFont(FontFactory.HELVETICA,5)));
                document.add(new Paragraph("Blood Group: " + childRs.getString("groupeSang"),FontFactory.getFont(FontFactory.HELVETICA,15)));
                document.add(new Paragraph(" ", FontFactory.getFont(FontFactory.HELVETICA,5)));
                document.add(new Paragraph("Medical Info: " + childRs.getString("infoMedicaux"),FontFactory.getFont(FontFactory.HELVETICA,15)));
                document.add(new Paragraph(" ", FontFactory.getFont(FontFactory.HELVETICA,5)));
                document.add(new Paragraph("Province: " + childRs.getString("province"),FontFactory.getFont(FontFactory.HELVETICA,15)));
                document.add(new Paragraph(" ", FontFactory.getFont(FontFactory.HELVETICA,5)));
                document.add(new Paragraph("City: " + childRs.getString("ville"),FontFactory.getFont(FontFactory.HELVETICA,15)));
            } else {
                document.add(new Paragraph("No child information found for ID: " + childId));
            }

            childRs.close();
            childStmt.close();

            String vaxHistoryQuery = "SELECT dateR, nomV AS vaccineName, nomC AS vaccinationCenter FROM `vax`.`RendezVous` R INNER JOIN `vax`.`Vaccin` V ON R.Vaccin_idV = V.idV INNER JOIN `vax`.`CentreVax` C ON R.CentreVax_idC = C.idC WHERE R.Enfant_idE = ? AND R.statusR = 'completed'";
            PreparedStatement vaxHistoryStmt = conn.prepareStatement(vaxHistoryQuery);
            vaxHistoryStmt.setInt(1, Integer.parseInt(childId));
            ResultSet vaxHistoryRs = vaxHistoryStmt.executeQuery();

            if (vaxHistoryRs.next()) {
                document.add(new Paragraph(" ", FontFactory.getFont(FontFactory.HELVETICA)));
                document.add(new Paragraph("Vaccination History", FontFactory.getFont(FontFactory.HELVETICA_BOLD,18,darkBlue)));
                document.add(new Paragraph(" ", FontFactory.getFont(FontFactory.HELVETICA)));

                PdfPTable table = new PdfPTable(3);
                table.setWidthPercentage(100);

                PdfPCell cell = new PdfPCell(new Phrase("Date",FontFactory.getFont(FontFactory.HELVETICA_BOLD,15)));
                cell.setBackgroundColor(LIGHT_GRAY);
                cell.setPadding(8);
                table.addCell(cell);

                cell = new PdfPCell(new Phrase("Vaccine Name",FontFactory.getFont(FontFactory.HELVETICA_BOLD,15)));
                cell.setBackgroundColor(LIGHT_GRAY);
                cell.setPadding(8);
                table.addCell(cell);

                cell = new PdfPCell(new Phrase("Vaccination Center",FontFactory.getFont(FontFactory.HELVETICA_BOLD,15)));
                cell.setBackgroundColor(LIGHT_GRAY);
                cell.setPadding(8);
                table.addCell(cell);

                do {
                    String date = vaxHistoryRs.getString("dateR");
                    PdfPCell dateCell = new PdfPCell(new Phrase(date,FontFactory.getFont(FontFactory.HELVETICA,15)));
                    dateCell.setPadding(10);
                    table.addCell(dateCell);

                    String vaccineName = vaxHistoryRs.getString("vaccineName");
                    PdfPCell vaccineNameCell = new PdfPCell(new Phrase(vaccineName,FontFactory.getFont(FontFactory.HELVETICA,15)));
                    vaccineNameCell.setPadding(10);
                    table.addCell(vaccineNameCell);

                    String vaccinationCenter = vaxHistoryRs.getString("vaccinationCenter");
                    PdfPCell vaccinationCenterCell = new PdfPCell(new Phrase(vaccinationCenter,FontFactory.getFont(FontFactory.HELVETICA,15)));
                    vaccinationCenterCell.setPadding(10);
                    table.addCell(vaccinationCenterCell);
                } while (vaxHistoryRs.next());

                document.add(table);
            } else {
                document.add(new Paragraph("No vaccination history found for this child."));
            }

            vaxHistoryRs.close();
            vaxHistoryStmt.close();

            conn.close();
            
            document.add(new Paragraph("Signature :",FontFactory.getFont(FontFactory.HELVETICA_BOLD,16,darkBlue)));
            document.add(new Paragraph(" ", FontFactory.getFont(FontFactory.HELVETICA_BOLD)));
            document.add(new Paragraph(" ", FontFactory.getFont(FontFactory.HELVETICA_BOLD)));
            document.add(new Paragraph(" ", FontFactory.getFont(FontFactory.HELVETICA)));

            document.close();
        } catch (SQLException e) {
            e.printStackTrace();
            response.setContentType("text/html");
            response.getWriter().println("Error retrieving records. Please try again.");
        }
    }
}
