<template>
    <ul class="timeline">
        <div v-bind:id="'volume-' + year" v-for="year in years">
            <post-by-year :year-item="year"></post-by-year>
        </div>
    </ul>
</template>

<script>
    import Vue from 'vue'
    import axios from 'axios'
    import GetPostsByYear from './GetPostsByYear.vue'

    export default {
        name: 'Issues',
        data () {
            return {
                title: 'Comparativ',
                posts: [],
                loading: '',
                post:'',
                years:'',
                year_pre: '',
                open: false,
            }
        },
        created () {
            this.getYears()
            document.title = this.title
            this.loadIssueYear()
        },
        methods: {
            toggle: function() {
                this.open = !this.open
            },
            getYears () {
                Vue.set(this,'loading',true)
                let postsUrl = 'http://207.154.194.122/index.php/comparativ/api/v1/issues?apiToken=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IlwiNTYyMzk3YzJlZDcwYzJkMGM2MjhkNjM3Yzk5NDJjNGVkYWM0YWQ0Y1wiIg.iZq1-Su8ofxMYuQ0mXRWmSKlhuR319hh5-qy-O9QT5c'
                axios.get(postsUrl)
                    .then(response => {
                        this.year_pre = response.data



                        // Removes Duplicates from Array and returns unique Items via underscore
                        this.years_unsorted = _.uniq(_.map(this.year_pre, 'year'))

                        // Sort list descending
                        this.years = this.years_unsorted.sort(function(a, b){return b-a});

                        Vue.set(this,'loading',false)
                    })
                    .catch(e => {
                        console.log(e)
                    })
            },
            loadIssueYear: function() {
                Vue.set(this,'loading',true)
                let postsUrl = 'https://brstaging.tk/wp-json/wp/v2/issue'

                axios.get(postsUrl)
                    .then(response => {
                        this.posts = response.data
                        Vue.set(this,'loading',false)
                    })
                    .catch(e => {
                        console.log(e)
                    })
            },
        },
        components: {
            'post-by-year': GetPostsByYear,
        }
    }
</script>