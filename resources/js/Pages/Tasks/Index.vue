<script setup>
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
import { Head, Link, useForm } from '@inertiajs/vue3';
import Pagination from '@/Components/Pagination.vue';
defineProps({
    tasks: [Object, Array],
    title: String,
    date: String,
    url: String,
    _status: String
});
const form = useForm({});
const deleteTasks = (id) => {
    if (confirm("Are you sure you want to move this to trash")) {
        form.delete(route("tasks.destroy", { id: id }), {
            preserveScroll: true,
        });
    }
};

</script>

<template>

    <Head title="Tasks List" />

    <AuthenticatedLayout>
        <template #header>
            <h2 class="font-semibold text-xl text-gray-800 leading-tight">Tasks List</h2>
        </template>
        <div class="py-1">
            <div class="max-w-7xl mx-auto sm:px-1 py-3 px-1 lg:px-8">
                <div class="bg-white py-2 shadow-sm sm:rounded-lg lg:px-2 px-1">
                    <fieldset class="border border-gray-300 px-20 py-10">
                        <legend class="text-gray-900 font-bold">Filter Data Tasks List</legend>
                        <form :action="route('tasks.index')" method="GET">
                            <div class="grid grid-cols-1 lg:grid-cols-4 lg:place-items-end">
                                <div class="px-1 mb-2">
                                    <label>Title</label>
                                    <input type="text" name="title" class="w-full rounded" :value="title"
                                        placeholder="Search by title">
                                </div>
                                <div class="px-1 mb-2">
                                    <label>Status</label>
                                    <select name="status" class="w-full rounded" :value="_status">
                                        <option value="">All Statuses</option>
                                        <option value="pending">pending</option>
                                        <option value="in-progress">in-progress</option>
                                        <option value="completed">completed</option>
                                    </select>
                                </div>
                                <div class="px-1 mb-2">
                                    <label>Due Date</label>
                                    <input type="date" name="due_date" class="w-full rounded" :value="date">
                                </div>
                                <div class="px-1 mb-2 w-full">
                                    <button type="submit"
                                        class="bg-green-500 w-full hover:bg-green-600 text-white rounded py-2">Search
                                    </button>
                                </div>
                            </div>
                        </form>
                    </fieldset>


                </div>
            </div>
        </div>
        <div class="py-1">

            <div class="max-w-7xl mx-auto sm:px-1 px-1 lg:px-8">
                <div class="bg-white overflow-hidden py-4 shadow-sm sm:rounded-lg lg:px-20 px-1">

                    <div class="flex justify-start">
                        <Link :href="route('tasks.create')"
                            class="bg-green-700 text-white rounded px-4 py-2 hover:bg-green-800">
                        Add Task
                        </Link>
                    </div>
                    <div class="overflow-x-auto mt-3">
                        <table class="w-full text-sm text-left rtl:text-right text-gray-500 dark:text-gray-400">
                            <thead
                                class="text-xs text-gray-700 uppercase bg-gray-300 dark:bg-gray-700 dark:text-gray-400">
                                <tr>
                                    <th scope="col" class="px-6 py-3">
                                        No
                                    </th>
                                    <th scope="col" class="px-6 py-3">
                                        Title
                                    </th>
                                    <th scope="col" class="px-6 py-3">
                                        User Assign
                                    </th>
                                    <th scope="col" class="px-6 py-3">
                                        Due Date
                                    </th>
                                    <th scope="col" class="px-6 py-3">
                                        Status
                                    </th>
                                    <th scope="col" class="px-6 py-3">
                                        Action
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr v-for="(list, index) in tasks.data" :key="index"
                                    class="bg-white border-b text-gray-800 dark:bg-gray-800 dark:border-gray-700">
                                    <td scope="row"
                                        class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                                        {{ index + 1 }}
                                    </td>
                                    <td class="px-6 py-4">
                                        {{ list.title }}
                                    </td>
                                    <td class="px-6 py-4">
                                        {{ list.name }}
                                    </td>
                                    <td class="px-6 py-4">
                                        {{ list.due_date }}
                                    </td>
                                    <td class="px-6 py-4">
                                        <span class="px-5 py-1 text-white rounded-full"
                                            :class="{ 'bg-yellow-400': list.status === 'pending', 'bg-green-500': list.status === 'in-progress', 'bg-blue-500': list.status === 'completed' }">{{
                            list.status }}</span>
                                    </td>
                                    <td class="px-6 py-4">
                                        <div class="flex justify-center">
                                            <Link :href="`tasks/${list.id}`">
                                            <svg class="w-6 h-6 text-yellow-400 cursor-pointer dark:text-white"
                                                aria-hidden="true" xmlns="http://www.w3.org/2000/svg" width="24"
                                                height="24" fill="none" viewBox="0 0 24 24">
                                                <path stroke="currentColor" stroke-linecap="round"
                                                    stroke-linejoin="round" stroke-width="2"
                                                    d="M15 4h3a1 1 0 0 1 1 1v15a1 1 0 0 1-1 1H6a1 1 0 0 1-1-1V5a1 1 0 0 1 1-1h3m0 3h6m-3 5h3m-6 0h.01M12 16h3m-6 0h.01M10 3v4h4V3h-4Z" />
                                            </svg>
                                            </Link>
                                            <Link :href="`tasks/${list.id}/edit`">
                                            <svg class="w-6 h-6 text-green-600 dark:text-white" aria-hidden="true"
                                                xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                fill="currentColor" viewBox="0 0 24 24">
                                                <path fill-rule="evenodd"
                                                    d="M11.32 6.176H5c-1.105 0-2 .949-2 2.118v10.588C3 20.052 3.895 21 5 21h11c1.105 0 2-.948 2-2.118v-7.75l-3.914 4.144A2.46 2.46 0 0 1 12.81 16l-2.681.568c-1.75.37-3.292-1.263-2.942-3.115l.536-2.839c.097-.512.335-.983.684-1.352l2.914-3.086Z"
                                                    clip-rule="evenodd" />
                                                <path fill-rule="evenodd"
                                                    d="M19.846 4.318a2.148 2.148 0 0 0-.437-.692 2.014 2.014 0 0 0-.654-.463 1.92 1.92 0 0 0-1.544 0 2.014 2.014 0 0 0-.654.463l-.546.578 2.852 3.02.546-.579a2.14 2.14 0 0 0 .437-.692 2.244 2.244 0 0 0 0-1.635ZM17.45 8.721 14.597 5.7 9.82 10.76a.54.54 0 0 0-.137.27l-.536 2.84c-.07.37.239.696.588.622l2.682-.567a.492.492 0 0 0 .255-.145l4.778-5.06Z"
                                                    clip-rule="evenodd" />
                                            </svg>
                                            </Link>
                                            <svg @click="deleteTasks(list.id)"
                                                class="w-6 h-6 text-red-600 dark:text-white" aria-hidden="true"
                                                xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                fill="currentColor" viewBox="0 0 24 24">
                                                <path fill-rule="evenodd"
                                                    d="M8.586 2.586A2 2 0 0 1 10 2h4a2 2 0 0 1 2 2v2h3a1 1 0 1 1 0 2v12a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V8a1 1 0 0 1 0-2h3V4a2 2 0 0 1 .586-1.414ZM10 6h4V4h-4v2Zm1 4a1 1 0 1 0-2 0v8a1 1 0 1 0 2 0v-8Zm4 0a1 1 0 1 0-2 0v8a1 1 0 1 0 2 0v-8Z"
                                                    clip-rule="evenodd" />
                                            </svg>


                                        </div>
                                    </td>
                                </tr>

                            </tbody>
                        </table>
                        <Pagination class="mt-4" :links="tasks.links" :url="url"/>
                    </div>

                </div>
            </div>
        </div>
    </AuthenticatedLayout>
</template>
