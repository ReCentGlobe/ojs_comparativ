{**
 * templates/frontend/components/subscriptionContact.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display the contact details for a journal's subscriptions
 *
 * @uses $subscriptionAdditionalInformation string HTML text description
 *       subcription information
 * @uses $subscriptionMailingAddress string Contact address for subscriptions
 * @uses $subscriptionName string Contact name for subscriptions
 * @uses $subscriptionPhone string Contact phone number for subscriptions
 * @uses $subscriptionEmail string Contact email address for subscriptions
 *}
 <div class="cmp_subscription_contact grid grid-cols-1 md:grid-cols-3 gap-8">
	 {if $subscriptionName || $subscriptionPhone || $subscriptionEmail}
		 <div class="contact col-span-1">
			 <h4 class="text-lg font-bold border-l-4 border-primary pl-2 mb-4">
				 {translate key="about.subscriptionsContact"}
			 </h4>

			 {if $subscriptionName}
				 <div class="name font-semibold mb-1">
					 {$subscriptionName|escape}
				 </div>
			 {/if}

			 {if $subscriptionMailingAddress}
				 <div class="address text-sm text-gray-700 mb-1">
					 {$subscriptionMailingAddress|nl2br|strip_unsafe_html}
				 </div>
			 {/if}

			 {if $subscriptionPhone}
				 <div class="phone flex items-center gap-2 mb-1">
					<span class="label font-medium">
						{translate key="about.contact.phone"}
					</span>
					 <span class="value">
						{$subscriptionPhone|escape}
					</span>
				 </div>
			 {/if}

			 {if $subscriptionEmail}
				 <div class="email">
					 <a href="mailto:{$subscriptionEmail|escape}" class="text-primary hover:underline">
						 {$subscriptionEmail|escape}
					 </a>
				 </div>
			 {/if}
		 </div>
	 {/if}
 
	 {if $subscriptionAdditionalInformation}
		<div class="description col-span-2 text-sm text-gray-700">
			{$subscriptionAdditionalInformation|strip_unsafe_html}
		</div>
	{/if}


 </div>
