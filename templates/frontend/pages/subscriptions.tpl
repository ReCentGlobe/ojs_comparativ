{**
 * templates/frontend/pages/subscriptions.tpl
 *
 * Copyright (c) 2013-2017 Simon Fraser University
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * About the Journal Subscriptions.
 *
 *}
{include file="frontend/components/header.tpl" pageTitle="about.subscriptions"}

{capture assign="breadcrumbsHtml"}
    {include file="frontend/components/breadcrumbs.tpl" currentTitleKey="about.subscriptions"}
{/capture}
{include file="frontend/components/sectionHeader.tpl" breadcrumbs=$breadcrumbsHtml title={translate key="about.subscriptions"}}

<section class="bg-white py-12">
    <div class="container max-w-7xl mx-auto">
        <div class="grid">

            <div class="col-span-1 mb-8">
                {include file="frontend/components/subscriptionContact.tpl"}
            </div>

            <div class="col-span-1 mb-4">
                <h4 class="text-lg font-bold border-b border-gray-200 pb-2">ENIUGH Membership Options</h4>
            </div>

            {if $individualSubscriptionTypes|@count}
                <div class="subscriptions_individual col-span-1 mb-8">
                    <h4 class="text-lg font-bold border-b border-gray-200 pb-2">{translate key="about.subscriptions.individual"}</h4>
                    <p class="text-red-600">{translate key="subscriptions.individualDescription"}
                        {if !$isUserLoggedIn}
                            <a href="/v2/user/register" class="inline-block px-3 py-1 border border-primary text-primary rounded hover:bg-primary hover:text-white transition ml-2">Register</a>
                            <a href="/v2/login" class="inline-block px-3 py-1 border border-primary text-primary rounded hover:bg-primary hover:text-white transition ml-2">Login</a>
                        {/if}
                    </p>

                    <div class="overflow-x-auto">
                        <table class="min-w-full divide-y divide-gray-200">
                            <tr class="bg-gray-100">
                                <th class="px-4 py-2">{translate key="about.subscriptionTypes.name"}</th>
                                <th class="px-4 py-2">{translate key="about.subscriptionTypes.format"}</th>
                                <th class="px-4 py-2">{translate key="about.subscriptionTypes.duration"}</th>
                                <th class="px-4 py-2">{translate key="about.subscriptionTypes.cost"}</th>
                            </tr>
                            {foreach from=$individualSubscriptionTypes item=subscriptionType}
                                <tr class="border-b">
                                    <td class="px-4 py-2">
                                        <div class="font-semibold">{$subscriptionType->getLocalizedName()|escape}</div>
                                        <div class="text-sm text-gray-600">{$subscriptionType->getLocalizedDescription()|strip_unsafe_html}</div>
                                    </td>
                                    <td class="px-4 py-2">{translate key=$subscriptionType->getFormatString()}</td>
                                    <td class="px-4 py-2">{$subscriptionType->getDurationYearsMonths()|escape}</td>
                                    <td class="px-4 py-2">{$subscriptionType->getCost()|string_format:"%.2f"}
                                        &nbsp;({$subscriptionType->getCurrencyStringShort()|escape})
                                    </td>
                                </tr>
                            {/foreach}
                        </table>
                    </div>
                    {if $isUserLoggedIn}
                        <div class="subscriptions_individual_purchase field mt-4">
                            <a class="inline-block px-4 py-2 border border-primary text-primary rounded hover:bg-primary hover:text-white transition" href="{url page="user" op="purchaseSubscription" path="individual"}">
							<span class="icon">
								<i class="fa fa-shopping-cart"></i>
							</span>
                                <span>{translate key="user.subscriptions.purchaseNewSubscription"}</span>
                            </a>
                        </div>
                    {/if}
                </div>
            {/if}

            {if $institutionalSubscriptionTypes|@count}
                <div class="subscriptions_institutional col-span-1 mb-8">
                    <h4 class="text-lg font-bold border-b border-gray-200 pb-2">{translate key="about.subscriptions.institutional"}</h4>
                    <p>{translate key="subscriptions.institutionalDescription"}
                        {if !$isUserLoggedIn}
                            <a href="/v2/user/register" class="inline-block px-3 py-1 border border-primary text-primary rounded hover:bg-primary hover:text-white transition ml-2">Register</a>
                            <a href="/v2/login" class="inline-block px-3 py-1 border border-primary text-primary rounded hover:bg-primary hover:text-white transition ml-2">Login</a>
                        {/if}
                    </p>
                    <div class="overflow-x-auto">
                        <table class="min-w-full divide-y divide-gray-200">
                            <tr class="bg-gray-100">
                                <th class="px-4 py-2">{translate key="about.subscriptionTypes.name"}</th>
                                <th class="px-4 py-2">{translate key="about.subscriptionTypes.format"}</th>
                                <th class="px-4 py-2">{translate key="about.subscriptionTypes.duration"}</th>
                                <th class="px-4 py-2">{translate key="about.subscriptionTypes.cost"}</th>
                            </tr>
                            {foreach from=$institutionalSubscriptionTypes item=subscriptionType}
                                <tr class="border-b">
                                    <td class="px-4 py-2">
                                        <div class="font-semibold">{$subscriptionType->getLocalizedName()|escape}</div>
                                        <div class="text-sm text-gray-600">{$subscriptionType->getLocalizedDescription()|strip_unsafe_html}</div>
                                    </td>
                                    <td class="px-4 py-2">{translate key=$subscriptionType->getFormatString()}</td>
                                    <td class="px-4 py-2">{$subscriptionType->getDurationYearsMonths()|escape}</td>
                                    <td class="px-4 py-2">{$subscriptionType->getCost()|string_format:"%.2f"}
                                        &nbsp;({$subscriptionType->getCurrencyStringShort()|escape})
                                    </td>
                                </tr>
                            {/foreach}
                        </table>
                    </div>
                    {if $isUserLoggedIn}
                        <div class="subscriptions_institutional_purchase field mt-4">
                            <a class="inline-block px-4 py-2 border border-primary text-primary rounded hover:bg-primary hover:text-white transition" href="{url page="user" op="purchaseSubscription" path="institutional"}">
							<span class="icon">
								<i class="fa fa-shopping-cart"></i>
							</span>
                                <span>{translate key="user.subscriptions.purchaseNewSubscription"}</span>
                            </a>
                        </div>
                    {/if}
                </div>
            {/if}
        </div>

    </div>
</section>

{include file="frontend/components/footer.tpl"}
