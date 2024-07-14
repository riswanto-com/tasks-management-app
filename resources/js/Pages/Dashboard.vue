<script setup>
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
import { Head, Link } from '@inertiajs/vue3';

const props = defineProps(["pending", "inProgress", "completed", "completedProgress"]);
</script>

<template>

    <Head title="Dashboard" />

    <AuthenticatedLayout>
        <template #header>
            <h2 class="font-semibold text-xl text-gray-800 leading-tight">Dashboard</h2>
        </template>

        <div class="py-12">
            <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
                <div class="overflow-hidden shadow-sm sm:rounded-lg">
                    <div class="py-2 text-green-900">Welcome to Application Tasks Management !!</div>

                </div>
            </div>
            <div class="max-w-7xl mx-auto sm:px-6 lg:px-8 mt-5">
                <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                    <div class="p-6 text-gray-900 bg-gray-200 font-bold">You're Progress Tasks</div>

                    <div class="px-10 py-5">
                        <div class="flex justify-between mb-1 mt-3">
                            <span class="text-base font-medium text-yellow-700 dark:text-white">Pending</span>
                            <span class="text-sm font-medium text-yellow-700 dark:text-white">{{ pending }}</span>
                        </div>
                        <div class="w-full bg-gray-200 rounded-full h-2.5 dark:bg-gray-700">
                            <div class="bg-yellow-400 h-2.5 rounded-full" :style="{ width: pending > 0 ? 'width:100%' : '0%' }">
                            </div>
                        </div>
                        <div class="flex justify-between mb-1 mt-3">
                            <span class="text-base font-medium text-green-700 dark:text-white">In Progress</span>
                            <span class="text-sm font-medium text-green-700 dark:text-white">{{ inProgress }}</span>
                        </div>
                        <div class="w-full bg-gray-200 rounded-full h-2.5 dark:bg-gray-700">
                            <div class="bg-green-400 h-2.5 rounded-full" :style="{ width: inProgress > 0 ? '100%' : '0%' }">
                            </div>
                        </div>
                        <div class="flex justify-between mb-1 mt-3">
                            <span class="text-base font-medium text-blue-700 dark:text-white">Completed</span>
                            <span class="text-sm font-medium text-blue-700 dark:text-white">{{ completed }}</span>
                        </div>
                        <div class="w-full bg-gray-200 rounded-full h-2.5 dark:bg-gray-700">
                            <div class="bg-blue-400 h-2.5 rounded-full"
                                :style="{ width: completed > 0 ? completedProgress + '%' : '0%' }"></div>
                        </div>
                    </div>
                    <div class="p-6 text-gray-900 flex justify-center">
                        <Link :href="route('tasks.index')" class="bg-green-700  py-2 rounded text-white lg:px-10 w-full lg:w-52 flex justify-center">View List Task</Link>
                    </div>
                </div>
            </div>
        </div>
    </AuthenticatedLayout>
</template>
