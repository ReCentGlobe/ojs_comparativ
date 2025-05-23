{**
 * templates/frontend/components/registrationFormContexts.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display role selection for all of the journals/presses on this site
 *
 * @uses $contexts array List of journals/presses on this site that have enabled registration
 * @uses $readerUserGroups array Associative array of user groups with reader
 *  permissions in each context.
 * @uses $authorUserGroups array Associative array of user groups with author
 *  permissions in each context.
 * @uses $reviewerUserGroups array Associative array of user groups with reviewer
 *  permissions in each context.
 * @uses $userGroupIds array List group IDs this user is assigned
 *}

{* Only display the context role selection when registration is taking place
   outside of the context of any one journal/press. *}
{if !$currentContext}

	{* Allow users to register for any journal/press on this site *}
	<fieldset name="contexts" class="border border-gray-300 rounded p-4 mb-6">
		<legend class="font-bold text-primary mb-2">
			{translate key="user.register.contextsPrompt"}
		</legend>
		<div class="fields">
			<div id="contextOptinGroup" class="context_optin">
				<ul class="contexts space-y-6">
					{foreach from=$contexts item=context}
						{assign var=contextId value=$context->getId()}
						<li class="context mb-4">
							<div class="name font-semibold mb-2">
								{$context->getLocalizedName()}
							</div>
							<fieldset class="roles border border-gray-200 rounded p-3">
								<legend class="font-medium text-gray-700 mb-2">
									{translate key="user.register.otherContextRoles"}
								</legend>
								{foreach from=$readerUserGroups[$contextId] item=userGroup}
									{if $userGroup->getPermitSelfRegistration()}
										{assign var="userGroupId" value=$userGroup->getId()}
											<label class="flex items-center gap-2 mb-1">
												<input type="checkbox" name="readerGroup[{$userGroupId}]"{if in_array($userGroupId, $userGroupIds)} checked="checked"{/if}>
												{$userGroup->getLocalizedName()}
											</label>
									{/if}
								{/foreach}
								{foreach from=$authorUserGroups[$contextId] item=userGroup}
									{if $userGroup->getPermitSelfRegistration()}
										{assign var="userGroupId" value=$userGroup->getId()}
											<label class="flex items-center gap-2 mb-1">
												<input type="checkbox" name="authorGroup[{$userGroupId}]"{if in_array($userGroupId, $userGroupIds)} checked="checked"{/if}>
												{$userGroup->getLocalizedName()}
											</label>
									{/if}
								{/foreach}
								{foreach from=$reviewerUserGroups[$contextId] item=userGroup}
									{if $userGroup->getPermitSelfRegistration()}
										{assign var="userGroupId" value=$userGroup->getId()}
											<label class="flex items-center gap-2 mb-1">
												<input type="checkbox" name="reviewerGroup[{$userGroupId}]"{if in_array($userGroupId, $userGroupIds)} checked="checked"{/if}>
												{$userGroup->getLocalizedName()}
											</label>
									{/if}
								{/foreach}
							</fieldset>
						</li>
					{/foreach}
				</ul>
			</div>
		</div>
	</fieldset>
{/if}
