<script setup>
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
import { Head, Link } from '@inertiajs/vue3';
const props = defineProps(["tasks"]);
</script>

<template>

    <Head title="Task Detail" />

    <AuthenticatedLayout>
        <template #header>
            <h2 class="font-semibold text-xl text-gray-800 leading-tight">Tasks Detail</h2>
        </template>

        <div class="py-12">
            <div class="max-w-7xl mx-auto sm:px-2  px-2 lg:px-8">
                <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg lg:px-5 py-2 px-2">
                    <div class="flex justify-end">
                        <Link :href="route('tasks.index')"
                            class="rounded px-20 py-1 text-white bg-red-600 hover:bg-red-700">
                        Back to List
                        </Link>
                    </div>
                    <div class="w-full mt-2">
                        <form>
                            <div class="grid grid-cols-1 lg:grid-cols-2">
                                <div class="mb-2 mt-2 px-2">
                                    <label for="first-name"
                                        class="block font-extrabold text-lg leading-6 text-gray-900">Title</label>
                                    <div class="mt-0">
                                        <span class="text-gray-600">{{ tasks[0].title }}</span>
                                    </div>
                                </div>
                                <div class="mb-2 mt-2 px-2">
                                    <label for="first-name"
                                        class="block text-lg font-extrabold leading-6 text-gray-900">Assign
                                        To
                                        User</label>
                                    <div class="mt-0">
                                        <span>{{ tasks[0].name }}</span>
                                    </div>
                                </div>
                                <div class="mb-2 mt-2 px-2">
                                    <label for="first-name"
                                        class="block text-lg font-extrabold leading-6 text-gray-900">
                                        Create Date</label>
                                    <div class="mt-0">
                                        <span>{{ tasks[0].created_at }}</span>
                                    </div>
                                </div>
                                <div class="mb-2 mt-2 px-2">
                                    <label for="first-name"
                                        class="block text-lg font-extrabold leading-6 text-gray-900">Due
                                        date</label>
                                    <div class="mt-0">
                                        <span>{{ tasks[0].due_date }}</span>
                                    </div>
                                </div>
                                <div class="mb-2 mt-2 px-2">
                                    <label for="about"
                                        class="block text-lg font-extrabold leading-6 text-gray-900">About
                                    </label>
                                    <div class="mt-0">
                                        <textarea disabled id="about" name="about" rows="3"
                                            class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-lg sm:leading-6" />
                                    </div>

                                </div>

                                <div class="mb-2 mt-2 px-2">
                                    <label for="title"
                                        class="block text-lg font-extrabold leading-6 text-gray-900 ">Status</label>
                                    <div class="mt-0 py-2">
                                        <span class="px-5 py-1 text-white rounded-full"
                                            :class="{ 'bg-yellow-400': tasks[0].status === 'pending', 'bg-green-500': tasks[0].status === 'in-progress', 'bg-blue-500': tasks[0].status === 'completed' }">{{
                                            tasks[0].status }}</span>
                                    </div>
                                </div>
                            </div>

                        </form>

                    </div>
                </div>
            </div>
        </div>
    </AuthenticatedLayout>
</template>
