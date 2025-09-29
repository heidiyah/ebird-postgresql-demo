--Add primary keys
-- ALTER TABLE obs
-- ADD PRIMARY KEY (global_unique_identifier);

-- ALTER TABLE sub
-- ADD PRIMARY KEY (sampling_event_identifier);

-- ALTER TABLE loc
-- ADD PRIMARY KEY (locality_id);

-- ALTER TABLE tax
-- ADD PRIMARY KEY (common_name);

-- ALTER TABLE sed
-- ADD PRIMARY KEY (sampling_event_identifier);

--Add foreign keys
ALTER TABLE sub ADD CONSTRAINT sub_loc FOREIGN KEY (locality_id) REFERENCES location (locality_id);

ALTER TABLE obs ADD CONSTRAINT obs_taxon FOREIGN KEY (common_name) REFERENCES taxon (common_name);

ALTER TABLE obs ADD CONSTRAINT obs_sub FOREIGN KEY (sampling_event_identifier) REFERENCES sub (sampling_event_identifier);

ALTER TABLE sed ADD CONSTRAINT sed_sub FOREIGN KEY (sampling_event_identifier) REFERENCES sub (sampling_event_identifier);
