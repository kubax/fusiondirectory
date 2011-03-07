{if $multiple_support}
<input type="hidden" value="1" name="group_mulitple_edit">
{/if}


<table summary="" style="width:100%;">
 <tr>
  <td style="width:50%; vertical-align:top;">
   <table summary="" style="width:100%">
    <tr>
     <td><LABEL for="cn">{t}Group name{/t}</LABEL>{$must}</td>
     <td>
{if $multiple_support}
	<input type='text' id="dummy1" name="dummy1" size=25 maxlength=60 value="{t}Multiple edit{/t}" disabled>
{else}
{render acl=$cnACL}
       <input type='text' id="cn" name="cn" size=25 maxlength=60 value="{$cn}" title="{t}Posix name of the group{/t}">
{/render}
{/if}
     </td>
    </tr>
    <tr>
     <td>
      <LABEL for="description">{t}Description{/t}</LABEL>
     </td>
     <td>
{render acl=$descriptionACL checkbox=$multiple_support checked=$use_description}
      <input type='text' id="description" name="description" size=40 maxlength=80 value="{$description}" title="{t}Descriptive text for this group{/t}">
{/render}
     </td>
    </tr>
    <tr>
     <td colspan=2> 
      <div style="height:15px;"></div> 
     </td>
    </tr>
    <tr>
     <td>
      <LABEL for="base">{t}Base{/t}</LABEL>{$must}
     </td>
     <td>
{render acl=$baseACL checkbox=$multiple_support checked=$use_base}
       {$base}
{/render}
     </td>
    </tr>
    <tr>
      <td colspan=2> <div style="height:15px; width:100%; border-bottom:1px solid #909090;"></div> </td>
    </tr>
    <tr>
      <td colspan=2> <div style="height:15px; width:100%;"></div> </td>
    </tr>
{if $multiple_support}

{else}
    <tr>
     <td colspan=2>
{render acl=$gidNumberACL}
      <input type=checkbox name="force_gid" value="1" title="{t}Normally IDs are autogenerated, select to specify manually{/t}" 
	{$force_gid} onclick="changeState('gidNumber')">
{/render}
	<LABEL for="gidNumber">{t}Force GID{/t}</LABEL>
      &nbsp;
{render acl=$gidNumberACL}
      <input type='text' name="gidNumber" size=9 maxlength=9 id="gidNumber" {$forceMode} value="{$gidNumber}" title="{t}Forced ID number{/t}">
{/render}
     </td>
    </tr>
{/if}

{if $multiple_support}
    <tr>
    <td colspan=2>
		{render acl=$sambaGroupTypeACL checkbox=$multiple_support checked=$use_smbgroup}
			<input class="center" type=checkbox name="smbgroup" value="1" {$smbgroup}>{t}Select to create a samba conform group{/t}
		{/render}
	</td>
	</tr>
	<tr>
	<td colspan=2>
		{render acl=$sambaGroupTypeACL checkbox=$multiple_support checked=$use_groupType}
			<select size="1" name="groupType">
				{html_options options=$groupTypes selected=$groupType}
			</select>
		{/render}
      &nbsp;
      <LABEL for="">{t}in domain{/t}</LABEL>
      &nbsp;

		{render acl=$sambaDomainNameACL checkbox=$multiple_support checked=$use_sambaDomainName}
			<select id="sambaDomainName" size="1" name="sambaDomainName">
		   		{html_options values=$sambaDomains output=$sambaDomains selected=$sambaDomainName}
		  	</select>
		{/render}
	</td>
	</tr>

{else}
    <tr>
     <td colspan=2>
{render acl=$sambaGroupTypeACL}
      <input type=checkbox name="smbgroup" value="1" {$smbgroup}  title="{t}Select to create a samba conform group{/t}">
{/render}
{render acl=$sambaGroupTypeACL}
      <select size="1" name="groupType">
       {html_options options=$groupTypes selected=$groupType}
      </select>
{/render}
      &nbsp;
      <LABEL for="">{t}in domain{/t}</LABEL>
      &nbsp;
{render acl=$sambaDomainNameACL}
      <select id="sambaDomainName" size="1" name="sambaDomainName">
       {html_options values=$sambaDomains output=$sambaDomains selected=$sambaDomainName}
      </select>
{/render}
     </td>
    </tr>
    {/if}

	{if $pickupGroup == "true"}
    <tr>
      <td colspan=2> <div style="height:15px; width:100%; border-bottom:1px solid #909090;"></div> </td>
    </tr>
    <tr>
      <td colspan=2> <div style="height:15px; width:100%;"></div> </td>
    </tr>
    <tr>
     <td colspan=2>
{render acl=$fonGroupACL checkbox=$multiple_support checked=$use_fon_group}
      <input class="center" type=checkbox name="fon_group" value="1" {$fon_group}>{t}Members are in a phone pickup group{/t}
{/render}
     </td>
    </tr>
	{/if}
	{if $nagios == "true"}
    <tr>
      <td colspan=2> <div style="height:15px; width:100%; border-bottom:1px solid #909090;"></div> </td>
    </tr>
    <tr>
      <td colspan=2> <div style="height:15px; width:100%;"></div> </td>
    </tr>
    <tr>
     <td colspan=2>
{render acl=$nagiosGroupACL checkbox=$multiple_support checked=$use_nagios_group}
      <input class="center" type=checkbox name="nagios_group" value="1" {$nagios_group}>{t}Members are in a nagios group{/t}
{/render}
     </td>
    </tr>
	{/if}
    <tr>
      <td colspan=2> <div style="height:15px; width:100%; border-bottom:1px solid #909090;"></div> </td>
    </tr>
    <tr>
      <td colspan=2> <div style="height:15px; width:100%;"></div> </td>
    </tr>
{if !$multiple_support}
	<tr>
	 <td colspan="2">
		    {t}Trust mode{/t}&nbsp;
    {render acl=$trustmodeACL}
        <select name="trustmode" id="trustmode" size=1
            onChange="changeSelectState('trustmode', 'wslist');
                      changeSelectState('trustmode', 'add_ws');
                      changeSelectState('trustmode', 'del_ws');">
          {html_options options=$trustmodes selected=$trustmode}
        </select>
    {/render}
    {render acl=$trustmodeACL}
       <select style="width:100%" id="wslist" name="workstation_list[]" size=8 multiple {$trusthide}>
        {html_options values=$workstations output=$workstations}
        {if $emptyArrAccess}
            <option disabled>&nbsp;</option>
        {/if}
       </select>
    {/render}
       <br>
    {render acl=$trustmodeACL}
       <input type="submit" id="add_ws" value="{msgPool type=addButton}" name="add_ws" {$trusthide}>&nbsp;
    {/render}
    {render acl=$trustmodeACL}
       <input type="submit" id="del_ws" value="{msgPool type=delButton}" name="delete_ws" {$trusthide}>
    {/render}

	 </td>
	</tr>

{else}

	<tr>
	 <td colspan="2">
    <input type="checkbox" name="use_trustmode" {if $use_trustmode} checked {/if}
        class="center" onClick="$('div_trustmode').toggle();">
		    {t}Trust mode{/t}&nbsp;
	<div {if !$use_trustmode} style="display: none;" {/if} id="div_trustmode">
    {render acl=$trustmodeACL}
        <select name="trustmode" id="trustmode" size=1
            onChange="changeSelectState('trustmode', 'wslist');
                      changeSelectState('trustmode', 'add_ws');
                      changeSelectState('trustmode', 'del_ws');">
          {html_options options=$trustmodes selected=$trustmode}
        </select>
    {/render}
    {render acl=$trustmodeACL}
       <select style="width:100%" id="wslist" name="workstation_list[]" size=8 multiple {$trusthide}>
        {html_options values=$workstations output=$workstations}
        {if $emptyArrAccess}
            <option disabled>&nbsp;</option>
        {/if}
       </select>
    {/render}
       <br>
    {render acl=$trustmodeACL}
       <input type="submit" id="add_ws" value="{msgPool type=addButton}" name="add_ws" {$trusthide}>&nbsp;
    {/render}
    {render acl=$trustmodeACL}
       <input type="submit" id="del_ws" value="{msgPool type=delButton}" name="delete_ws" {$trusthide}>
    {/render}
		</div>
	 </td>
	</tr>

{/if}
   </table>

  </td>
  <td style="border-left:1px solid #A0A0A0">
   &nbsp;
  </td>

  <td style="vertical-align:top;">

   <table summary="" style="width:100%">
    <tr>
     <td style="vertical-align:top; width:50%">
      <b><LABEL for="members">{t}Group members{/t}</LABEL></b>
      <br>
{render acl=$memberUidACL}

	{if $multiple_support}
	  <select style="width:100%; height:380px;" id="members" name="members[]" size=15 multiple>
		{foreach from=$memberUid_All item=name key=key}
			<option value="{$key}">{$name}&nbsp;({t}In all groups{/t})</option>
		{/foreach}
		{foreach from=$memberUid_Some item=name key=key}
        <option value="{$key}" style='color: #888888; background: #DDDDDD;background-color: #DDDDDD;'>{$name}&nbsp;({t}Not in all groups{/t})</option>
		{/foreach}
	  </select>
	{else}
      <select style="width:100%; height:380px;" id="members" name="members[]" size=15 multiple>
       {html_options options=$members}
		<option disabled>&nbsp;</option>
      </select>
	{/if}
{/render}
      <br>
{render acl=$memberUidACL}
      <input type=submit name="edit_membership" value="{msgPool type=addButton}">
{/render}
      &nbsp;
{render acl=$memberUidACL}
      <input type=submit name="del_users" value="{msgPool type=delButton}">
{/render}
     </td>
    </tr> 
   </table>
  </td>

 </tr>
</table>

<input type="hidden" name="groupedit" value="1">

<!-- Place cursor -->
<script language="JavaScript" type="text/javascript">
  <!-- // First input field on page
	focus_field('cn');
  -->
</script>
