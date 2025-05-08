<template>
    <Ripple
      class="[mask-image:linear-gradient(to_bottom,white,transparent)]"
      circle-class="border-[var(--color-primary-lightest)] rounded-full"
    />
</template>

<script setup lang="ts">
import Ripple from "./Ripple.vue";
import RippleCircle from "./RippleCircle.vue";
</script>
