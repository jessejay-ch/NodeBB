<div class="row">
	<div class="col-12">
		<div class="registration card mb-3">
			<div class="card-header text-bg-primary">
				[[admin/manage/registration:queue]]
			</div>
			<!-- IF !users.length -->
			<p class="card-body">
				[[admin/manage/registration:description, {config.relative_path}/admin/settings/user#user-registration]]
			</p>
			<!-- ENDIF !users.length -->
			<div class="table-responsive">
				<table class="table table-striped users-list">
					<thead>
						<tr>
							<th>[[admin/manage/registration:list.name]]</th>
							<th>[[admin/manage/registration:list.email]]</th>
							<th class="hidden-xs">[[admin/manage/registration:list.ip]]</th>
							<th class="hidden-xs">[[admin/manage/registration:list.time]]</th>
							<!-- BEGIN customHeaders -->
							<th class="hidden-xs">{customHeaders.label}</th>
							<!-- END customHeaders -->
							<th></th>
						</tr>
					</thead>
					<tbody>
						{{{ each users }}}
						<tr data-username="{users.usernameEscaped}">
							<td>
								<!-- IF users.usernameSpam -->
								<i class="fa fa-times-circle text-danger" title="[[admin/manage/registration:list.username-spam, {users.spamData.username.frequency}, {users.spamData.username.appears}, {users.spamData.username.confidence}]]"></i>
								<!-- ELSE -->
								<!-- IF users.spamChecked -->
								<i class="fa fa-check text-success"></i>
								<!-- ENDIF users.spamChecked -->
								<!-- ENDIF users.usernameSpam -->
								{users.username}
							</td>
							<td>
								<!-- IF users.emailSpam -->
								<i class="fa fa-times-circle text-danger" title="[[admin/manage/registration:list.email-spam, {users.spamData.email.frequency}, {users.spamData.email.appears}]]"></i>
								<!-- ELSE -->
								<!-- IF users.spamChecked -->
								<i class="fa fa-check text-success"></i>
								<!-- ENDIF users.spamChecked -->
								<!-- ENDIF users.emailSpam -->
								{users.email}
							</td>
							<td class="hidden-xs">
								<!-- IF users.ipSpam -->
								<i class="fa fa-times-circle text-danger" title="[[admin/manage/registration:list.ip-spam, {users.spamData.ip.frequency}, {users.spamData.ip.appears}]]"></i>
								<!-- ELSE -->
								<!-- IF users.spamChecked -->
								<i class="fa fa-check text-success"></i>
								<!-- ENDIF users.spamChecked -->
								<!-- ENDIF users.ipSpam -->
								{users.ip}
								{{{ each users.ipMatch }}}
								<br>
								{buildAvatar(users.ipMatch, "24px", true)}
								<a href="{config.relative_path}/uid/{users.ipMatch.uid}">{users.ipMatch.username}</a>
								{{{ end }}}
							</td>
							<td class="hidden-xs">
								<span class="timeago" title="{users.timestampISO}"></span>
							</td>

							{{{ each users.customRows }}}
							<td class="hidden-xs">{users.customRows.value}</td>
							{{{ end }}}

							<td>
								<div class="btn-group float-end">
									<button class="btn btn-success btn-sm" data-action="accept"><i class="fa fa-check"></i></button>
									<button class="btn btn-danger btn-sm" data-action="delete"><i class="fa fa-times"></i></button>
									{{{ each users.customActions }}}
									<button id="{users.customActions.id}" title="{users.customActions.title}" class="btn btn-sm {users.customActions.class}">
										<i class="fa {users.customActions.icon}"></i>
									</button>
									{{{ end }}}
								</div>
							</td>
						</tr>
						{{{ end }}}
					</tbody>
				</table>
			</div>

			<!-- IMPORT partials/paginator.tpl -->
		</div>

		<div class="invitations card">
			<div class="card-header text-bg-success">
				[[admin/manage/registration:invitations]]
			</div>
			<p class="card-body">
				[[admin/manage/registration:invitations.description]]
			</p>
			<div class="table-responsive">
				<table class="table table-striped invites-list">
					<thead>
						<tr>
							<th>[[admin/manage/registration:invitations.inviter-username]]</th>
							<th>[[admin/manage/registration:invitations.invitee-email]]</th>
							<th>[[admin/manage/registration:invitations.invitee-username]]</th>
						</tr>
					</thead>
					<tbody>
						{{{ each invites }}}
						{{{ each invites.invitations }}}
						<tr data-invitation-mail="{invites.invitations.email}"
								data-invited-by="{invites.username}">
							<td class ="invited-by"><!-- IF @first -->{invites.username}<!-- ENDIF @first --></td>
							<td>{invites.invitations.email}</td>
							<td>{invites.invitations.username}
								<div class="btn-group float-end">
									<button class="btn btn-danger btn-sm" data-action="delete"><i class="fa fa-times"></i></button>
								</div>
							</td>
						</tr>
						{{{ end }}}
						{{{ end }}}
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
