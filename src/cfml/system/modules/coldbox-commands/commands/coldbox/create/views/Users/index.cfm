<cfoutput>
<h1>Users</h1>

<!--- MessageBox --->
<cfif flash.exists( "notice" )>
    <div class="alert alert-#flash.get( "notice" ).type#">
        #flash.get( "notice" ).message#
    </div>
</cfif>

<!--- Create Button --->
#html.href( href="Users.new", text="Create User", class="btn btn-primary")#
#html.br(2)#

<!--- Listing --->
<cfoutput>
<table class="table table-hover table-striped">
	<thead>
		<tr>
		<cfloop array="#metadata.properties#" index="thisProp">
			<cfif compareNoCase(thisProp.fieldType,"column") EQ 0>
			<th>#thisProp.name#</th>
			</cfif>
		</cfloop>
			<th width="150">Actions</th>
		</tr>
	</thead>
	<tbody>
		<cfloop array="##prc.#inputStruct.pluralName###" index="thisRecord">
		<tr>
			<cfloop array="#metadata.properties#" index="thisProp">
				<cfif compareNoCase(thisProp.fieldType,"column") EQ 0>
					<td>##thisRecord.get#thisProp.name#()##</td>
				</cfif>
			</cfloop>
			<!--- Actions --->
			<td>
				##html.startForm(action="#inputStruct.pluralname#.delete")##
					##html.hiddenField(name="#metadata.pk#", bind=thisRecord)##
					##html.submitButton(value="Delete", onclick="return confirm('Really Delete Record?')", class="btn btn-danger")##
					##html.href(href="#inputStruct.pluralName#.edit", queryString="#metadata.pk#=##thisRecord.get#metadata.pk#()##", text="Edit", class="btn btn-info")##
				##html.endForm()##
			</td>
		</tr>
		</cfloop>
	</tbody>
</table>
</cfoutput>
</cfoutput>