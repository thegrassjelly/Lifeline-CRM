using System;
using System.Data.SqlClient;

public partial class Account_Membership_AddDependents : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Helper.ValidateUser();
        this.Form.DefaultButton = this.btnAdd.UniqueID;
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        var UserID = Session["UserID"].ToString();

        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = "SELECT TOP 1 MembershipID FROM Memberships ORDER BY MembershipID DESC";
            int MembershipID = (int)cmd.ExecuteScalar();

            cmd.CommandText = "INSERT INTO Dependents (FirstName, LastName, Birthday, Relationship, OtherRel, MembershipID, UserID) VALUES " +
                "(@depOneFirstName, @depOneLastName, @depOneBirthday, @depOneRelatonship, @depOneOtherRel, @depOneMembershipID, @depOneUserID), " +
                "(@depTwoFirstName, @depTwoLastName, @depTwoBirthday, @depTwoRelatonship, @depTwoOtherRel, @depTwoMembershipID, @depTwoUserID), " +
                "(@depThreeFirstName, @depThreeLastName, @depThreeBirthday, @depThreeRelatonship, @depThreeOtherRel, @depThreeMembershipID, @depThreeUserID), " +
                "(@depFourFirstName, @depFourLastName, @depFourBirthday, @depFourRelatonship, @depFourOtherRel, @depFourMembershipID, @depFourUserID)";
            cmd.Parameters.AddWithValue("@depOneUserID", UserID);
            cmd.Parameters.AddWithValue("@depOneFirstName", depOneFn.Text);
            cmd.Parameters.AddWithValue("@depOneLastName", depOneLn.Text);
            cmd.Parameters.AddWithValue("@depOneBirthday", depOneBday.Text);
            cmd.Parameters.AddWithValue("@depOneRelatonship", ddlDepOneRel.SelectedValue);
            cmd.Parameters.AddWithValue("@depOneOtherRel", depOneRelOthers.Text);
            cmd.Parameters.AddWithValue("@depOneMembershipID", MembershipID);

            cmd.Parameters.AddWithValue("@depTwoUserID", UserID);
            cmd.Parameters.AddWithValue("@depTwoFirstName", depTwoFn.Text);
            cmd.Parameters.AddWithValue("@depTwoLastName", depTwoLn.Text);
            cmd.Parameters.AddWithValue("@depTwoBirthday", depTwoBday.Text);
            cmd.Parameters.AddWithValue("@depTwoRelatonship", ddlDepTwoRel.SelectedValue);
            cmd.Parameters.AddWithValue("@depTwoOtherRel", depTwoRelOthers.Text);
            cmd.Parameters.AddWithValue("@depTwoMembershipID", MembershipID);

            cmd.Parameters.AddWithValue("@depThreeUserID", UserID);
            cmd.Parameters.AddWithValue("@depThreeFirstName", depThreeFn.Text);
            cmd.Parameters.AddWithValue("@depThreeLastName", depThreeLn.Text);
            cmd.Parameters.AddWithValue("@depThreeBirthday", depThreeBday.Text);
            cmd.Parameters.AddWithValue("@depThreeRelatonship", ddlDepThreeRel.SelectedValue);
            cmd.Parameters.AddWithValue("@depThreeOtherRel", depThreeOthers.Text);
            cmd.Parameters.AddWithValue("@depThreeMembershipID", MembershipID);

            cmd.Parameters.AddWithValue("@depFourUserID", UserID);
            cmd.Parameters.AddWithValue("@depFourFirstName", depFourFn.Text);
            cmd.Parameters.AddWithValue("@depFourLastName", depFourLn.Text);
            cmd.Parameters.AddWithValue("@depFourBirthday", depFourBday.Text);
            cmd.Parameters.AddWithValue("@depFourRelatonship", ddlFourRel.SelectedValue);
            cmd.Parameters.AddWithValue("@depFourOtherRel", depFourOthers.Text);
            cmd.Parameters.AddWithValue("@depFourMembershipID", MembershipID);
            cmd.ExecuteNonQuery();
            Response.Redirect("~/Account/Membership/RenewalTwo.aspx");
        }
    }
}