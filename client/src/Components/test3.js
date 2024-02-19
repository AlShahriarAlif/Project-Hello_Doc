import React, { useState, useEffect } from 'react'
const Test3 = () => {
	const [results, setResults] = useState([]);

	const getData = async () => {
		try {
			const res = await fetch("http://localhost:5000/Hello_Doc", {
				method: "GET",
				headers: {
					"Content-Type": "application/json",
					"reequest-type": "all_ambulance"
				},
			});
			const data = await res.json();
			setResults(data);
		} catch (err) {
			console.error(err.message);

		}
	}

	useEffect(() => {
		getData();
		// console.log(results);

	}, []);
	return (
		<div class="text-gray-900 bg-gray-200">
			<div class="p-4 flex">
				<h1 class="text-3xl">
					Users
				</h1>
			</div>
			<div class="px-3 py-4 flex justify-center">
				<table class="w-full text-md bg-white shadow-md rounded mb-4">
					<tbody>
						<tr class="border-b">
							<th class="text-left p-3 px-5">id</th>
							<th class="text-left p-3 px-5">name</th>
							<th class="text-left p-3 px-5">email</th>
							<th class="text-left p-3 px-5">edit</th>
							<th class="text-left p-3 px-5">Delete</th>
							<th></th>
						</tr>
						{results.map((results, index) => (
							<tr class="border-b hover:bg-orange-100">
								<td class="p-3 px-5">{results.doc_id}</td>
								<td class="p-3 px-5">{results.doc_name}</td>
								<td class="p-3 px-5">{results.email} </td>
							</tr>
						))}
					</tbody>
				</table>
			</div>
		</div>

	)
}

export default Test3