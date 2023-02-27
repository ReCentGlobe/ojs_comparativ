<template>
    <div class="timeline-query">
        <li class="timeline-header">
            <a @click="toggleItem">
                <span class="tag is-primary">{{yearItem}}</span>
            </a>
        </li>

        <li v-show="toggled" v-for="post in posts" class="timeline-item">
            <div class="timeline-marker"></div>
            <div class="timeline-content">
                <p class="heading">Vol {{ post.volume }} No {{ post.number }} ({{ post.year }})</p>
                <p><a :href="post.publishedUrl">{{post.title.en_US}}</a></p>
            </div>
        </li>
    </div>

</template>

<script>
    import Vue from 'vue'
    import axios from 'axios'

    export default {
        props: ['yearItem'],
        name: 'PostByYear',
        data () {
            return {
                showDetails: 'false',
                posts: [],
                post:'',
                toggled: false,
                currentYear: this.yearItem,
            }
        },
        methods: {
            toggleItem: function() {
                this.toggled = !this.toggled
                this.loadIssueYear()
            },
            loadIssueYear: function() {
                Vue.set(this,'loading',true)
                let postsUrl = 'http://207.154.194.122/index.php/comparativ/api/v1/issues?apiToken=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IlwiNTYyMzk3YzJlZDcwYzJkMGM2MjhkNjM3Yzk5NDJjNGVkYWM0YWQ0Y1wiIg.iZq1-Su8ofxMYuQ0mXRWmSKlhuR319hh5-qy-O9QT5c'
                if (this.currentYear !== undefined) {
                    postsUrl += '&year=' + this.currentYear
                }

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
    }
</script>